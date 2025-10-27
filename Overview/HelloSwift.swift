//
//  HelloSwift.swift
//  Overview
//
//  Created by Jinping Shi on 2025/10/27.
//

import Foundation

protocol HelloProtocol {
    func getHelloWorld() -> String
    func printHelloWorld()
}

class HelloSwift: HelloProtocol {
    private let message: String

    init() {
        self.message = "Hello World from Swift"
    }
    
    func getHelloWorld() -> String {
        return message
    }
    
    func printHelloWorld() {
        print(message)
    }

    static func staticHelloWorld() -> String {
        return "Hello World from Swift (Static)"
    }
}

struct HelloSwiftStruct {
    let message = "Hello World from Swift Struct"
    
    func getHelloWorld() -> String {
        return message
    }
}
