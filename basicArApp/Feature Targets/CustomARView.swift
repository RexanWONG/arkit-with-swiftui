//
//  CustomArView.swift
//  basicArApp
//
//  Created by Rexan Wong on 21/9/2023.
//

// Import necessary frameworks
import ARKit
import RealityKit
import SwiftUI
import Combine

class CustomARView: ARView {
    // This initializes the ARView with a given frame.
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    // This initializer is required but not implemented. If called, the app will crash.
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // A convenience initializer that sets up the ARView with the device screen size and subscribes to AR actions.
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        subscribeToActionStream()
    }
    
    // Holds references to Combine subscriptions to prevent them from being deallocated.
    private var cancellables: Set<AnyCancellable> = []
    
    // This function subscribes the ARView to listen to AR actions like placing blocks or removing all anchors.
    func subscribeToActionStream() {
        ARManager.shared.actionStream
            .sink { [weak self] action in
                switch action {
                    case .placeBlock(let color):
                        self?.placeBlock(ofColor: color)
                    case .removeAllAnchors:
                        self?.scene.anchors.removeAll()
                }
            }
            .store(in: &cancellables)
    }
    
    // This function creates a 3D block of a given color and places it in the AR scene.
    func placeBlock(ofColor color: Color) {
        let block = MeshResource.generateBox(size: 1)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: block, materials: [material])
        
        let anchor = AnchorEntity(plane: .vertical)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
    
    // Some example AR configurations for demonstration purposes.
    func configurationExamples() {
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
        
        let _ = ARGeoTrackingConfiguration()
        let _ = ARFaceTrackingConfiguration()
        let _ = ARBodyTrackingConfiguration()
    }
    
    // EXAMPLES
    // Some example ways to create and use anchors in an AR scene.
    func anchorExamples() {
        let coordinateAnchor = AnchorEntity(world: .zero)
       
        let _ = AnchorEntity(plane: .horizontal)
        let _ = AnchorEntity(plane: .vertical)
        
        let _ = AnchorEntity(.face)
        
        let _ = AnchorEntity(.image(group: "group", name: "name"))
        
        scene.addAnchor(coordinateAnchor)
    }
    
    // Some example ways to create and use entities (3D objects) in an AR scene.
    func entityExamples() {
        // load from usdz
        let _ = try? Entity.load(named: "usdzFileName")
        
        // load from reality file
        let _ = try? Entity.load(named: "realityFileName")
        
        // generate entity with code
        let box = MeshResource.generateBox(size: 1)
        let entity = ModelEntity(mesh: box)
        
        // add entity to anchor
        let anchor = AnchorEntity()
        anchor.addChild(entity)
    }
}  
