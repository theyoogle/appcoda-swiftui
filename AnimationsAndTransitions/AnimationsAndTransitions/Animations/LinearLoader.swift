//
//  LinearLoader.swift
//  AnimationsAndTransitions
//
//  Created by The YooGle on 07/06/22.
//

import SwiftUI

struct LinearLoader: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(y: -25)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .onAppear() {
            self.isLoading = true
        }
    }
}




























struct LinearLoader_Previews: PreviewProvider {
    static var previews: some View {
        LinearLoader()
    }
}
