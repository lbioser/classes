//
//  PersonRow.swift
//  Test2
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct PersonRow: View {
    var p:Person = Person(name: "", age: 0)
    var body: some View {
        VStack{
            HStack{
                       Text(p.name)
                       Text("\(p.age)")
                   }
            Text(p.story)
        }
       
    }
}

#Preview {
    PersonRow()
}
