//
//  SettingsView.swift
//  MyForm
//
//  Created by The YooGle on 24/06/22.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showCheckinOnly = false
    @State private var maxPriceLevel = 5
    
    @EnvironmentObject var settingStore: SettingStore
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Sort Preference")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.text)
                        }
                    }
                }
                
                Section(header: Text("Filter Preference")) {
                    Toggle(isOn: $showCheckinOnly) {
                        Text("Show Checkin Only")
                    }
                    
                    Stepper {
                        if maxPriceLevel < 5 {
                            maxPriceLevel += 1
                        }
                    } onDecrement: {
                        if maxPriceLevel > 1 {
                            maxPriceLevel -= 1
                        }
                    } label: {
                        Text("Show \(maxPriceLevel) or below")
                    }

                }

            }
            .navigationBarTitle("Settings")
            .navigationBarItems(
                leading: Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                },
                trailing: Button {
                    self.settingStore.showCheckInOnly = self.showCheckinOnly
                    self.settingStore.displayOrder = self.selectedOrder
                    self.settingStore.maxPriceLevel = self.maxPriceLevel
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
            )
        }
        .onAppear() {
            self.showCheckinOnly = self.settingStore.showCheckInOnly
            self.selectedOrder = self.settingStore.displayOrder
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        }
    }
}


























struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingStore())
    }
}
