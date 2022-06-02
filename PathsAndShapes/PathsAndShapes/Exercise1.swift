//
//  Exercise1.swift
//  PathsAndShapes
//
//  Created by The YooGle on 02/06/22.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
            path.addLine(to: CGPoint(x: 200, y: 40))
            path.addLine(to: CGPoint(x: 0, y: 40))
        }
        .fill(Color.green)
    }
}
























struct Exercise1_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1()
    }
}
