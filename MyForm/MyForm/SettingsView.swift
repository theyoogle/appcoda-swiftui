//
//  SettingsView.swift
//  MyForm
//
//  Created by The YooGle on 24/06/22.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private var displayOrders = ["Alphabetical", "Show Favorite First", "Show Check-in First"]
    
    @State private var selectedOrder = 0
    @State private var showCheckinOnly = false
    @State private var maxPriceLevel = 5
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Sort Preference")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(0..<displayOrders.count, id: \.self) { index in
                            Text(displayOrders[index])
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
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
            )
        }
    }
}


























struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
