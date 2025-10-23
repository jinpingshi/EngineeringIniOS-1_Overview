//
//  Item.swift
//  Overview
//
//  Created by Jinping Shi on 2025/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
