//
//  CustomARViewReperesentable.swift
//  basicArApp
//
//  Created by Rexan Wong on 21/9/2023.
//

import SwiftUI

struct CustomARViewReperesentable: UIViewRepresentable {
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
}
