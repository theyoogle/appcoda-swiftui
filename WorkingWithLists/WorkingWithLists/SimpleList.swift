//
//  ContentView.swift
//  WorkingWithLists
//
//  Created by The YooGle on 09/06/22.
//

import SwiftUI

struct SimpleList: View {
    var body: some View {
        
//        List {
//            Text("Item 1")
//            Text("Item 2")
//            Text("Item 3")
//            Text("Item 4")
//        }
        
//        List {
//            ForEach(1...4, id: \.self) { i in
//                Text("Item \(i)")
//            }
//        }
        
//        List {
//            ForEach(1...4, id: \.self) {
//                Text("Item \($0)")
//            }
//        }
        
        List(1...4, id: \.self) {
            Text("Item \($0)")
        }
    }
}

























struct SimpleList_Previews: PreviewProvider {
    static var previews: some View {
        SimpleList()
    }
}
