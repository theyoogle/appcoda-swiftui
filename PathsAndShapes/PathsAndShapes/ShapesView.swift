//
//  ShapesView.swift
//  PathsAndShapes
//
//  Created by The YooGle on 02/06/22.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Test")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(
                    Dome()
                        .fill(Color.red)
                )
        }

    }
}

struct Dome: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint( x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}























struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
