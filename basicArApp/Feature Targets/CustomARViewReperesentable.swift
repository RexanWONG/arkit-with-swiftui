//
//  CustomARViewReperesentable.swift
//  basicArApp
//
//  Created by Rexan Wong on 21/9/2023.
//

// This file wraps the CustomARView for use in SwiftUI.
import SwiftUI

struct CustomARViewReperesentable: UIViewRepresentable {
    // Creates the custom AR view.
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    // Not needed for this demo
    func updateUIView(_ uiView: CustomARView, context: Context) {}
}
