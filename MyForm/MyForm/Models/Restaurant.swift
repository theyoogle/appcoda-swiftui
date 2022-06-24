//
//  Restaurant.swift
//  MyForm
//
//  Created by The YooGle on 24/06/22.
//

import Foundation

struct Restaurant: Identifiable {
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
    
    var id = UUID()
}
