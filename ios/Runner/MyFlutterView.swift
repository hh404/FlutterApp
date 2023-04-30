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
        label.text = "我是 iOS View"
    }
    
    func view() -> UIView {
        return label
    }
}
