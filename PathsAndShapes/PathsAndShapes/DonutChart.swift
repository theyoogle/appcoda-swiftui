//
//  DonutChart.swift
//  PathsAndShapes
//
//  Created by The YooGle on 02/06/22.
//

import SwiftUI

struct DonutChart: View {
    var body: some View {
        ZStack {
            
            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(Color(.systemBlue), lineWidth: 80)
            
            Circle()
                .trim(from: 0.4, to: 0.6)
                .stroke(Color(.systemTeal), lineWidth: 80)

            Circle()
                .trim(from: 0.6, to: 0.75)
                .stroke(Color(.systemPurple), lineWidth: 80)

            Circle()
                .trim(from: 0.75, to: 1)
                .stroke(Color(.systemYellow), lineWidth: 90)
                .overlay(
                    Text("25%")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 80, y: -100)
                )
        }
        .frame(width: 250, height: 250)
    }
}



























struct DonutChart_Previews: PreviewProvider {
    static var previews: some View {
        DonutChart()
    }
}
