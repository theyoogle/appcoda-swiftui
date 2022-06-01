//
//  CounterView.swift
//  StateAndBindings
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI

struct CounterView: View {
    
    @State private var count1 = 10
    @State private var count2 = 20
    @State private var count3 = 30
    
    var body: some View {
        
        VStack {
            
            Text(String(count1 + count2 + count3))
                .font(.system(size: 150, weight: .bold, design: .rounded))
            
            HStack {
                CounterButton(count: $count1, color: .blue)
                CounterButton(count: $count2, color: .green)
                CounterButton(count: $count3, color: .red)
            }
        }
    }
    
}

struct CounterButton: View {
    
    @Binding var count: Int
    var color: Color
    
    var body: some View {
        Button {
            self.count += 1
        } label: {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .overlay(
                    Text(String(count))
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
