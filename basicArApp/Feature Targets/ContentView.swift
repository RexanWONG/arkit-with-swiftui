//
//  ContentView.swift
//  basicArApp
//
//  Created by Rexan Wong on 21/9/2023.
//

// This is the main content view of the app.
import SwiftUI

struct ContentView: View {
    // An array of colors for block placement.
    @State private var colors: [Color] = [
        .green,
        .red,
        .blue
    ]
    var body: some View {
        CustomARViewReperesentable()
            .ignoresSafeArea()
            .overlay(alignment: .bottom) {
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            ARManager.shared.actionStream.send(.removeAllAnchors)
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                        }
                        
                        ForEach(colors, id: \.self) { color in
                            Button {
                                ARManager.shared.actionStream.send(.placeBlock(color: color))
                            } label: {
                                color
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(.regularMaterial)
                                    .cornerRadius(16)
                            }
                        }
                    }
                    .padding()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
