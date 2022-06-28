//
//  MyFormApp.swift
//  MyForm
//
//  Created by The YooGle on 24/06/22.
//

import SwiftUI

@main
struct MyFormApp: App {
    
    var settingStore = SettingStore()
    
    var body: some Scene {
        WindowGroup {
            SettingsView()
                .environmentObject(settingStore)
        }
    }
}
