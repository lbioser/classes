//
//  PersonList.swift
//  Test2
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct PersonList: View {
    @EnvironmentObject var pMnager: PersonManager
    @Environment(\.editMode) var editMode
    
    @State var isPresented1:Bool = false
    @State var isPresented2:Bool = false
    var body: some View {
        List {
            ForEach(PersonManager.AgePhase.allCases, id: \.self) { phase in
                
                Section(phase.rawValue) {
                    ForEach(pMnager.sortPersonWithAgePhase(phase: phase), id: \.self) { p in
                        
                        NavigationLink {
                            //PersonEditor(p: )
                            PersonEditor(p: p)
                        } label: {
                            //PersonRow(p: p)
                            PersonRow(p: p.wrappedValue)
                        }
                        
                        
                    }
                    
                }
                
                
            }
        }.navigationTitle("Person List By Age")
            .toolbar(content: {
               
                Button("ADD1") {
                    isPresented1 = true
                }.sheet(isPresented: $isPresented1) {
                    Text("1111")
                }
                Button("ADD2") {
                    isPresented2 = true
                }.sheet(isPresented: $isPresented2) {
                    Text("2222")
                }
             
                
            })
    }
}

enum SheetType:CaseIterable {

    case ADD
    case Decrese
}

#Preview {
    PersonList()
}
