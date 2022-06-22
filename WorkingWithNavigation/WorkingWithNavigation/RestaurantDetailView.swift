//
//  DetailView.swift
//  WorkingWithNavigation
//
//  Created by The YooGle on 21/06/22.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        // Customised Back Button
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                    .foregroundColor(.black)
            }
        )
    }
}































struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // going to be embedded in navigation view
        NavigationView {
            RestaurantDetailView(restaurant: restaurants[0])
        }
    }
}
