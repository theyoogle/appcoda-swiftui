//
//  ScrollOffsetKey.swift
//  ExpandableBottomSheet
//
//  Created by The YooGle on 10/07/22.
//

import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    
    static var defaultValue = CGFloat.zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
