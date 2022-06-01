//
//  PricingView.swift
//  WorkingWithStacks
//
//  Created by The YooGle on 23/05/22.
//

import SwiftUI

struct PricingView: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack {
            
            icon.map {
                Image(systemName: $0)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }

            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
            Text("per month")
                .font(.headline)
        }
        .foregroundColor(textColor)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
