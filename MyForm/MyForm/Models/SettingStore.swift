//
//  SettingsStore.swift
//  MyForm
//
//  Created by The YooGle on 24/06/22.
//

import Combine
import Foundation

final class SettingStore: ObservableObject {
    
    init() {
        UserDefaults.standard.register(defaults: [
            "view.preferences.showCheckInOnly": false,
            "view.preferences.displayOrder": 0,
            "view.preferences.maxPriceLevel": 5
        ])
    }
    
    @Published var showCheckInOnly: Bool = UserDefaults.standard.bool(forKey: "view.preferences.showCheckInOnly") {
        didSet {
            UserDefaults.standard.set(showCheckInOnly, forKey: "view.preferences.showCheckInOnly")
        }
    }
    
    @Published var displayOrder: DisplayOrderType = DisplayOrderType(type: UserDefaults.standard.integer(forKey: "view.preferences.showCheckInOnly")) {
        didSet {
            UserDefaults.standard.set(displayOrder.rawValue, forKey: "view.preferences.displayOrder")
        }
    }
    
    @Published var maxPriceLevel: Int = UserDefaults.standard.integer(forKey: "view.preferences.maxPriceLevel") {
        didSet {
            UserDefaults.standard.set(maxPriceLevel, forKey: "view.preferences.maxPriceLevel")
        }
    }
}
