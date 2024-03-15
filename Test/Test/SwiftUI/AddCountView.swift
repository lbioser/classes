//
//  AddCountView.swift
//  Test
//
//  Created by keloopA on 2024/3/1.
//

import SwiftUI

@objc
class AddCountViewVC: NSObject {
    @objc func makeCountVC(str defaultStr:String,with config:Config) -> UIViewController {
        return UIHostingController(rootView: AddCountView(config: config, defaultStr: defaultStr))
    }
  
}
struct AddCountView: View {
    @State var count: Int = 0
    @ObservedObject var config:Config
    var defaultStr:String
    var body: some View {
        Text(defaultStr)
        Text("Hello, World! : \(count)")
        Button {
            count += 1
        } label: {
            Text("Count++")
        }
        TextField("plase input..", text: $config.name)
        UIControlView(currentPage: $count)
    }
}


