//
//  DragState.swift
//  GestureHandling
//
//  Created by The YooGle on 10/07/22.
//

import CoreGraphics

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
        }
    }
}
