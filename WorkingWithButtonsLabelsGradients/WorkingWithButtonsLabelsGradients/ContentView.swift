//
//  StylesView.swift
//  WorkingWithButtonsLabelsGradients
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Button {
                print("Button Tapped")
            } label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    Text("Share")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(FullWidthButtonStyle())
            
            Button {
                print("Button Tapped")
            } label: {
                HStack {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                    Text("Edit")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(FullWidthButtonStyle())
            
            Button {
                print("Button Tapped")
            } label: {
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(FullWidthButtonStyle())
            
            Button {
                print("Button Tapped")
            } label: {
                Image(systemName: "plus")
            }
            .buttonStyle(CircleButtonStyle())
            
        }
    }
}





































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
