//
//  ARManager.swift
//  basicArApp
//
//  Created by Rexan Wong on 25/9/2023.
//

import Combine

class ARManager {
    static let shared = ARManager()
    private init() { }
    
    var actionStream = PassthroughSubject<ARAction, Never>()
}
