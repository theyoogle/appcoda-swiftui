//
//  Article.swift
//  WorkingWithScroll
//
//  Created by The YooGle on 21/06/22.
//

import Foundation

struct Article: Identifiable {
    var image: String
    var category: String
    var heading: String
    var author: String
    var rating: Int
    var excerpt: String
    
    var id = UUID()
}
