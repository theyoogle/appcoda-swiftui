//
//  DetailView.swift
//  ExpandableBottomSheet
//
//  Created by The YooGle on 10/07/22.
//

import SwiftUI

struct DetailView: View {
    
    let restaurant: Restaurant
    @Binding var isShow: Bool
    
    @State private var viewState = ViewState.half
    @State private var scrollOffset: CGFloat = 0.0
    
    @State private var postionOffset: CGFloat = 0.0
    @GestureState private var dragState = DragState.inactive
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HandleBar()
                
                ScrollView(.vertical) {
                    GeometryReader { scrollViewProxy in
//                        Text("\(scrollViewProxy.frame(in: .named("scrollview")).minY)")
                        Color.clear.preference(key: ScrollOffsetKey.self, value: scrollViewProxy.frame(in: .named("scrollview")).minY)
                    }
                    .frame(height: 0)
                    
                    VStack {
                        TitleBar()
                        HeaderView(restaurant: restaurant)
                        InfoView(icon: "map", info: restaurant.location)
                            .padding(.top)
                        InfoView(icon: "phone", info: restaurant.phone)
                        InfoView(icon: nil, info: restaurant.description)
                            .padding(.top)
                            .padding(.bottom, 100)
                    }
                    .offset(y: -self.scrollOffset)
                    .animation(nil)
                }
                .background(Color.white)
                .cornerRadius(10, antialiased: true)
                .disabled(self.viewState == .half)
                .coordinateSpace(name: "scrollview")
            }
            .offset(y: geometry.size.height/2 + self.dragState.translation.height + self.postionOffset)
            .offset(y: self.scrollOffset)
            .animation(.interpolatingSpring(stiffness: 200, damping: 25, initialVelocity: 10))
            .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture()
                    .updating($dragState, body: { value, state, transaction in
                        state = .dragging(translation: value.translation)
                        // state represents dragState variable
                    })
                    .onEnded({ value in
                        if self.viewState == .half {
                            if value.translation.height < -geometry.size.height * 0.25 {
                                self.postionOffset = -geometry.size.height/2 + 50
                                self.viewState = .full
                            }
                            
                            if value.translation.height > geometry.size.height * 0.3 {
                                self.isShow = false
                            }
                        }
                    })
            )
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                if self.viewState == .full {
                    self.scrollOffset = (value > 0) ? value : 0
                    
                    if self.scrollOffset > 120 {
                        self.postionOffset = 0
                        self.viewState = .half
                        self.scrollOffset = 0
                    }
                }
            }
        }
    }
}

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundColor(Color(.systemGray5))
            .cornerRadius(10)
    }
}

struct TitleBar: View {
    var body: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
    }
}

struct HeaderView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
            .clipped()
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        Text(restaurant.type)
                            .font(.system(.headline, design: .rounded))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                    Spacer()
                }
                .padding()
            )
    }
}

struct InfoView: View {
    
    let icon: String?
    let info: String
    
    var body: some View {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
        .padding(.horizontal)
    }
}















struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(restaurant: restaurants[1], isShow: .constant(true))
            .background(Color.black.opacity(0.3))
            .edgesIgnoringSafeArea(.all)
    }
}
