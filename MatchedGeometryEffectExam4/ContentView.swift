//
//  ContentView.swift
//  MatchedGeometryEffectExam4
//
//  Created by Erdi Ergene on 18.07.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    @Namespace private var namespace // <1>
    
    var body: some View {
        Group() {
            if isExpanded {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.pink)
                        .frame(width: 60, height: 60)
                        .matchedGeometryEffect(id: "rect", in: namespace) // <2>
                    Text("Hello SwiftUI!").fontWeight(.semibold)
                        .matchedGeometryEffect(id: "text", in: namespace) // <3>
                }
            } else {
                HStack {
                    Text("Hello SwiftUI!").fontWeight(.semibold)
                        .matchedGeometryEffect(id: "text", in: namespace) // <4>
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.pink)
                        .frame(width: 60, height: 60)
                        .matchedGeometryEffect(id: "rect", in: namespace) // <5>
                }
            }
        }.onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
