//
//  CollectionList.swift
//  WorkingWithLists
//
//  Created by The YooGle on 21/06/22.
//

import SwiftUI

struct CollectionList: View {
        
    var body: some View {
        
//        List(restaurants) { restaurant in
//            FullImageRow(restaurant: restaurant)
//        }
        
        List(restaurants.indices) { i in
            if (0...1).contains(i) {
                FullImageRow(restaurant: restaurants[i])
            } else {
                BasicImageRow(restaurant: restaurants[i])
            }
        }
    }
}

struct BasicImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}































struct CollectionList_Previews: PreviewProvider {
    static var previews: some View {
        CollectionList()
    }
}
