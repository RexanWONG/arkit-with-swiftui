# arkit-with-swiftui
This Basic AR App, built with SwiftUI, demonstrates how to integrate Apple's ARKit with SwiftUI, allowing developers to create augmented reality (AR) experiences within a SwiftUI-based app. By wrapping ARKit views in UIViewRepresentable structures, we can seamlessly blend AR content with SwiftUI user interfaces. This README provides a brief overview of how this integration works and the structure of the app.

## Table of Contents

- [How It Works](#how-it-works)
  - [ARKit and RealityKit](#arkit-and-realitykit)
  - [SwiftUI and UIViewRepresentable](#swiftui-and-uiviewrepresentable)
- [Application Structure](#application-structure)
- [Connecting ARKit to SwiftUI](#connecting-arkit-to-swiftui)



https://github.com/RexanWONG/arkit-with-swiftui/assets/96183717/bac2fab6-e81e-4e78-8026-8e1499e4d565

## How It Works

### ARKit and RealityKit

**ARKit** is Apple's framework for creating augmented reality experiences. It captures and processes live camera feed, tracks the world around you, and places 3D objects (like a block) in the real-world space.

**RealityKit** is a companion framework to ARKit and is used to create and manage 3D content in AR. In this app, we use it to generate a 3D block and place it in the AR scene.

### SwiftUI and UIViewRepresentable

**SwiftUI**, Apple's declarative UI framework, doesn't natively support ARKit's ARView. To bridge this gap, we use **UIViewRepresentable**, a SwiftUI structure that lets us wrap UIKit views (like ARView) and use them within SwiftUI.

In our app, `CustomARViewRepresentable` is a SwiftUI view that represents the ARView. This allows the AR experience to be embedded directly within SwiftUI views.

### Application Structure

- `CustomARView.swift`: Defines the custom AR view, where the bulk of the AR logic happens. It initializes AR configurations, places 3D blocks in the scene, and listens to AR actions like placing blocks or removing all anchors.
  
- `CustomARViewRepresentable.swift`: Wraps the CustomARView using UIViewRepresentable so that it can be used within SwiftUI.
  
- `ARManager.swift`: A singleton class that manages AR actions. It provides a stream of AR actions (`actionStream`) that other parts of the app can send actions to or subscribe to.
  
- `ContentView.swift`: The main content view of the app, presenting the AR view and overlay UI for block placement. It interacts with ARManager to send AR actions based on user input.
  
- `ARAction.swift`: An enum defining different AR actions, like placing a block of a certain color or removing all anchors from the scene.

### Connecting ARKit to SwiftUI

To integrate ARKit's ARView into SwiftUI, the process follows these steps:

1. **Create a Custom ARView**: The custom ARView (`CustomARView`) is a subclass of ARKit's ARView. This is where ARKit and RealityKit functionalities are implemented.
  
2. **Wrap ARView for SwiftUI**: Using UIViewRepresentable, the ARView is wrapped in a structure (`CustomARViewRepresentable`) to be used as a SwiftUI view.
  
3. **Use in SwiftUI**: The `CustomARViewRepresentable` can now be used like any other SwiftUI view, allowing for the integration of AR content within a SwiftUI interface.



