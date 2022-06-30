//
//  BasicImageRow.swift
//  MyForm
//
//  Created by The YooGle on 30/06/22.
//

import SwiftUI

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(restaurant.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text("$\(restaurant.priceLevel)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                
                Text(restaurant.type)
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }
            
            Spacer()
                .layoutPriority(-100)
            
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            if restaurant.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}













struct BasicImageRow_Previews: PreviewProvider {
    static var previews: some View {
        BasicImageRow(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3, isFavorite: true, isCheckIn: true))
            .previewLayout(.sizeThatFits)
    }
}
