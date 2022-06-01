//
//  CustomImage.swift
//  WorkingWithImages
//
//  Created by The YooGle on 13/05/22.
//

import SwiftUI

struct CustomImage: View {
    var body: some View {
        Image("paris")
            .resizable()
        
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 300)
        
            .aspectRatio(contentMode: .fill)     // Fill - Maintain Ascpect Ratio and Fill
            .frame(width: 300)
            .clipped()
//            .edgesIgnoringSafeArea(.all)
            
    }
}




































struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage()
    }
}
