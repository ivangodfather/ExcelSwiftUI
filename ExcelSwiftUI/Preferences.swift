//
//  Preferences.swift
//  ExcelSwiftUI
//
//  Created by Ivan Ruiz Monjo on 25/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import SwiftUI

struct WidthPreference: PreferenceKey {
    typealias Value = [Int:CGFloat]

    static let defaultValue: Value = [:]

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue()) { (a, b) -> CGFloat in
            max(a, b)
        }
    }
}

struct HeightPreference: PreferenceKey {
    typealias Value = [Int:CGFloat]
    
    static let defaultValue: Value = [:]
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue(), uniquingKeysWith: max)
    }
}

struct AnchorPreference: PreferenceKey {
    typealias Value = Anchor<CGRect>?

    static let defaultValue: Value = nil
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value ?? nextValue()
    }
    
}
