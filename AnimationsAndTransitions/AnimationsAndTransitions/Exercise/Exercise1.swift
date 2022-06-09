//
//  Exercise1.swift
//  AnimationsAndTransitions
//
//  Created by The YooGle on 08/06/22.
//

import SwiftUI

struct Exercise1: View {
    
    @State private var processing = false
    @State private var loading = false
    @State private var completed = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: loading ? 250 : 200, height: 60)
                .foregroundColor(completed ? .red : .green)
            
            if !processing {
                Text("Submit")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .transition(.move(edge: .top))
            }
            
            if processing && !completed {
                HStack {
                    Circle()
                        .trim(from: 0, to: 0.9)
                        .stroke(Color.white, lineWidth: 3)
                        .frame(width: 30, height: 30)
                        .rotationEffect(Angle(degrees: loading ? 360 : 0))
                        .animation(Animation.easeOut.repeatForever(autoreverses: false))
                    
                    Text("Processing")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
                .transition(.opacity)
                .onAppear() {
                    self.startProcessing()
                }
            }
            
            if completed {
                Text("Done")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .onAppear() {
                        self.endProcessing()
                    }
            }
        }
        .animation(.spring())
        .onTapGesture {
            self.processing.toggle()
        }
    }
    
    private func startProcessing() {
        self.loading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.completed = true
        }
    }
    
    private func endProcessing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.processing = false
            self.completed = false
            self.loading = false
        }
    }
    
    private func getText() -> String {
        if completed {
            return "Done"
        } else if loading {
            return "Processing"
        } else {
            return "Submit"
        }
    }
}























struct Exercise1_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1()
    }
}
