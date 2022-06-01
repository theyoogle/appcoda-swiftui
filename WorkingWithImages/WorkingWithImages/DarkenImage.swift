//
//  DarkenImage.swift
//  WorkingWithImages
//
//  Created by The YooGle on 13/05/22.
//

import SwiftUI

struct DarkenImage: View {
    var body: some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .overlay(
                Color.black
                    .opacity(0.4)
                    .overlay(
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .frame(width: 200)
                    )
            )
    }
}


































struct DarkenImage_Previews: PreviewProvider {
    static var previews: some View {
        DarkenImage()
    }
}
