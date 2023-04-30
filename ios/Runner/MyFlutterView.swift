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
     }
     
     func view() -> UIView {
         return label
     }
}
