//
//  ImageTextList.swift
//  WorkingWithLists
//
//  Created by The YooGle on 09/06/22.
//

import SwiftUI

struct ImageTextList: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petit e Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli" , "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donos tia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate" , "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var body: some View {
        List(restaurantNames.indices, id: \.self) { index in
            HStack {
                Image(self.restaurantImages[index])
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
                Text(self.restaurantNames[index])
            }
        }
    }
}

























struct ImageTextList_Previews: PreviewProvider {
    static var previews: some View {
        ImageTextList()
    }
}
