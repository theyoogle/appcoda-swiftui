//
//  StopButton.swift
//  PathsAndShapes
//
//  Created by The YooGle on 02/06/22.
//

import SwiftUI

struct StopButton: View {
    var body: some View {
        Circle()
            .foregroundColor(.green)
            .frame(width: 200, height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
            )
            
    }
}






















struct StopButton_Previews: PreviewProvider {
    static var previews: some View {
        StopButton()
    }
}
