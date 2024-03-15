//
//  PersonEditor.swift
//  Test2
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct PersonEditor: View {
    @Binding var p: Person
    @EnvironmentObject var pManger:PersonManager
    @State var pcopy: Person = Person(name: "", age: 0)
    var body: some View {
        VStack{
            PersonEditRow(title: "姓名", text: $pcopy.name)
            //PersonEditRow(title: "年龄", text: $p.age)
            PersonEditRow(title: "生平故事", text: $pcopy.story)
        }.onAppear(perform: {
            pcopy = p
        }).onDisappear(perform: {
            p = pcopy
            pManger.update(p: p)
            pManger.addPerson(p: pcopy)
        })
        
    }
}

struct PersonEditRow: View {
    var title: String
    @Binding var text:String
    var body: some View {
        HStack{
            Text(title)
            TextField("input..", text: $text)
        }
        
    }
}


#Preview {
    PersonEditor(p: .constant(Person(name: "", age: 0)))
}
