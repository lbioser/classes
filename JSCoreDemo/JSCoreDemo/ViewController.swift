//
//  ViewController.swift
//  JSCoreDemo
//
//  Created by keloopA on 2024/2/21.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nativeEvaluateJS()
        nativeEvaluateScriptFile()
        jsEvaluateNative()
    }

    //原生调用js代码
    func nativeEvaluateJS() {
        // 创建一个JSContext对象
        let jsContext = JSContext()
        
        // 执行JS代码 计算js变量a和b之和
        jsContext?.evaluateScript("var a = 1;var b = 2")
        let sum = jsContext?.evaluateScript("a+b").toInt32()
        
        // 通过下标获取变量、方法
        jsContext?.evaluateScript("var names = ['Sam', 'Bob', 'Jerry']")
        let names = jsContext?.objectForKeyedSubscript("names")
        let firstName = names?.objectAtIndexedSubscript(0).toString()
        
        // 定义方法并调用
        jsContext?.evaluateScript("var addFunc = function(a,b) { return a+b}")
        let result = jsContext?.evaluateScript("addFunc(a,b)").toNumber()
        
        // 也可以OC传参
        let addFunc = jsContext?.objectForKeyedSubscript("addFunc")
        let res = addFunc?.call(withArguments: [10, 20]).toInt32()
        print(res)
    }
    
    //原生代码调用.js文件
    func nativeEvaluateScriptFile() {
        let jsContext = JSContext()
        let path = Bundle.main.path(forResource: "nativeEvaluateScript", ofType: "js")
        let textStr = try? String(contentsOfFile: path ?? "", encoding: .utf8)
        jsContext?.evaluateScript(textStr)
        
        let subtractFunc = jsContext?.objectForKeyedSubscript("subtractFunc")
        let res = subtractFunc?.call(withArguments: [20, 10]).toInt32()
        print(res)
    }
    
    //js代码调用原生的函数
    func jsEvaluateNative() {
        let jsContext = JSContext()
        
        //实现一个加法函数
        let addFunc = { (a:Int, b:Int) in
            return a + b
        }
        jsContext?.setObject({ (a:Int, b:Int) in
            return a + b
        }, forKeyedSubscript: "addFunc" as (NSCopying & NSObjectProtocol))
        let addRes = jsContext?.evaluateScript("addFunc(3,4").toInt32()
        
        //实现一个减法函数
        let subtractFunc = { (a:Int, b:Int) in
            let args = JSContext.currentArguments()
            return a - b
        }
        jsContext?.setObject({ (a:Int, b:Int) in
            let args = JSContext.currentArguments()
            return a - b
        }, forKeyedSubscript: "subtractFunc" as (NSCopying & NSObjectProtocol))
        let subRes = jsContext?.evaluateScript("subtractFunc(5,4").toInt32()
        
        //js文件调用原生的函数
        let path = Bundle.main.path(forResource: "scriptEvaluateNative", ofType: "js")
        let textStr = try? String(contentsOfFile: path ?? "", encoding: .utf8)
        jsContext?.evaluateScript(textStr)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        jsEvaluateNative()
        
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        print(path)
    }
}


