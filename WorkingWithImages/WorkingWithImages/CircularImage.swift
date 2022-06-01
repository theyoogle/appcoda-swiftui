//
//  CircularImage.swift
//  WorkingWithImages
//
//  Created by The YooGle on 13/05/22.
//

import SwiftUI

struct CircularImage: View {
    var body: some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300)
            .clipShape(Circle())
//            .clipShape(Ellipse())
//            .clipShape(Capsule())
        
            .overlay(
                Image(systemName: "heart.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .opacity(0.5)
            )
    }
}

































struct CircularImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularImage()
    }
}
