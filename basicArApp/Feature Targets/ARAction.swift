//
//  ARAction.swift
//  basicArApp
//
//  Created by Rexan Wong on 25/9/2023.
//

// This is an enumeration of AR actions, used to communicate desired actions to the AR view.
import SwiftUI

enum ARAction {
    case placeBlock(color: Color)
    case removeAllAnchors
}
