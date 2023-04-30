//
//  MyFlutterView.swift
//  Runner
//
//  Created by huangjianwu on 2023/4/30.
//

import Foundation
import Flutter

class MyFlutterView: NSObject,FlutterPlatformView {
    
    let label = UILabel()
    
    init(_ frame: CGRect,viewID: Int64,args :Any?,messenger :FlutterBinaryMessenger) {
        super.init()
        if(args is NSDictionary){
            let dict = args as! NSDictionary
            label.text  = dict.value(forKey: "text") as! String
        }
        
        let methodChannel = FlutterMethodChannel(name: "com.flutter.guide.MyFlutterView", binaryMessenger: messenger)
        methodChannel.setMethodCallHandler { (call, result) in
            if (call.method == "setText") {
                if let dict = call.arguments as? Dictionary<String, Any> {
                    let name:String = dict["name"] as? String ?? ""
                    let age:Int = dict["age"] as? Int ?? -1
                    self.label.text = "hello,\(name),年龄：\(age)"
                }
            }
        }
    }
    
    func view() -> UIView {
        return label
    }
    
}
