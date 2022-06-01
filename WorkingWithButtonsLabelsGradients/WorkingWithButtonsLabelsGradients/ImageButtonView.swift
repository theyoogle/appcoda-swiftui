//
//  ImageButtonView.swift
//  WorkingWithButtonsLabelsGradients
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI

struct ImageButtonView: View {
    
    let gradient = LinearGradient(colors: [Color("DarkGreen"), Color("LightGreen")], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        
        VStack {
           
            Button {
                print("Button Tapped")
            } label: {
                Image(systemName: "trash")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            
            // --------------------------------------
            
            Button {
                print("Button Tapped")
            } label: {
                Image(systemName: "trash")
                    .padding()
                    .background(Color.red)
                    .clipShape(Circle())
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            
            // --------------------------------------
            
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
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(40)
            }
            
            // --------------------------------------
            
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
                .padding()
                .background(gradient)
                .foregroundColor(.white)
                .cornerRadius(40)
            }
            
            // --------------------------------------
            
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
                .padding()
                .background(gradient)
                .foregroundColor(.white)
                .cornerRadius(40)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
            }
            
            // --------------------------------------
            
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
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(40)
                .padding(.horizontal, 20)
            }
            
        }
    }
}


































struct ImageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ImageButtonView()
    }
}
