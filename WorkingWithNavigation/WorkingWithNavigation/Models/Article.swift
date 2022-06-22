//
//  Article.swift
//  WorkingWithNavigation
//
//  Created by The YooGle on 22/06/22.
//

import Foundation

struct Article: Identifiable {
    var title: String
    var author: String
    var rating: Int
    var excerpt: String
    var image: String
    var content: String
    
    var id = UUID()
}
