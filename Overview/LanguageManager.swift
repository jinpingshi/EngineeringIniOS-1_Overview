//
//  LanguageManager.swift
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

import Foundation

class LanguageManager {
    
    // Get Hello World from C
    func getHelloFromC() -> String {
        let cString = getHelloWorldC()
        return String(cString: cString!)
    }
    
    // Get Hello World from C++ (via Objective-C++ bridge)
    func getHelloFromCpp() -> String {
        let bridge = HelloCppBridge()
        return bridge.getHelloWorldFromCpp()
    }
    
    // Get Hello World from Objective-C
    func getHelloFromObjC() -> String {
        let ocHello = HelloOC()
        return ocHello.generateHelloWorld()
    }
    
    // Get Hello World from Objective-C class method
    func getHelloFromObjCClass() -> String {
        return HelloOC.getHelloWorld()
    }
    
    // Get Hello World from Swift
    func getHelloFromSwift() -> String {
        let swiftHello = HelloSwift()
        return swiftHello.getHelloWorld()
    }
    
    // Get Hello World from Swift static method
    func getHelloFromSwiftStatic() -> String {
        return HelloSwift.staticHelloWorld()
    }
    
    // Get Hello World from Swift struct
    func getHelloFromSwiftStruct() -> String {
        let swiftStruct = HelloSwiftStruct()
        return swiftStruct.getHelloWorld()
    }
}
