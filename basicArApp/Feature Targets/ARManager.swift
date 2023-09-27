//
//  ARManager.swift
//  basicArApp
//
//  Created by Rexan Wong on 25/9/2023.
//

// This is a Singleton class that manages AR-related actions.
import Combine

class ARManager {
    static let shared = ARManager() // Singleton instance
    private init() { }
    
    // A stream of AR actions that can be subscribed to.
    var actionStream = PassthroughSubject<ARAction, Never>()
}
