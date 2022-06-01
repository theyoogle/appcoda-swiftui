//
//  OverlayView.swift
//  WorkingWithImages
//
//  Created by The YooGle on 13/05/22.
//

import SwiftUI

struct ImageOverlay: View {
    var body: some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                
                Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
                    .fontWeight(.heavy)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .opacity(0.8)
                    .padding()
                
            , alignment: .top)
    }
}

































struct ImageOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageOverlay()
    }
}
