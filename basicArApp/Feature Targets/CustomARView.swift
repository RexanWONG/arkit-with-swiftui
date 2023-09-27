//
//  CustomArView.swift
//  basicArApp
//
//  Created by Rexan Wong on 21/9/2023.
//

import ARKit
import RealityKit
import SwiftUI
import Combine

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        subscribeToActionStream()
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
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
    
    func configurationExamples() {
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
        
        let _ = ARGeoTrackingConfiguration()
        let _ = ARFaceTrackingConfiguration()
        let _ = ARBodyTrackingConfiguration()
    }
    
    func placeBlock(ofColor color: Color) {
        let block = MeshResource.generateBox(size: 1)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: block, materials: [material])
        
        let anchor = AnchorEntity(plane: .vertical)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
    
    // EXAMPLES
    func anchorExamples() {
        let coordinateAnchor = AnchorEntity(world: .zero)
       
        let _ = AnchorEntity(plane: .horizontal)
        let _ = AnchorEntity(plane: .vertical)
        
        let _ = AnchorEntity(.face)
        
        let _ = AnchorEntity(.image(group: "group", name: "name"))
        
        scene.addAnchor(coordinateAnchor)
    }
    
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
