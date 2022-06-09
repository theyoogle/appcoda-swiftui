//
//  SimpleLoader.swift
//  AnimationsAndTransitions
//
//  Created by The YooGle on 04/06/22.
//

import SwiftUI

struct CircularLoader: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
//                .animation(Animation.default.repeatForever(autoreverses: false))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .onAppear() {
                    isLoading = true
                }
        }
    }
}



































struct CircularLoader_Previews: PreviewProvider {
    static var previews: some View {
        CircularLoader()
    }
}
