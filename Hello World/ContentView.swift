//
//  ContentView.swift
//  Hello World
//
//  Created by Avion Lowery on 10/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct ContentView: View {
    // ContentView: This allows you to use the contentview screen to visual see what you're coding
    @State var enlarge = false
    
    var body: some View {
        VStack {
            // Make closure - add content
            RealityView { content in
                // Add the initial RealityKit content
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(scene)
                }
            } update: { content in
                // Update the RealityKit content when SwiftUI state changes
                if let scene = content.entities.first {
                    // content.entities.first refers to "content" in Reality view line (20)
                    let uniformScale: Float = enlarge ? 1.5 : 1.0
                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
                enlarge.toggle()
            })

            VStack {
                Button {
                    enlarge.toggle()
                } label: {
                    Text(enlarge ? "Reduce RealityView Content" : "Enlarge RealityView Content")
                }
                .animation(.none, value: 0)
                .fontWeight(.semibold)
            }
            .padding()
            .glassBackgroundEffect()
        }
    }
}

// Please don't mess with the bottom lines - they make ContentView work
#Preview(windowStyle: .volumetric) {
    ContentView()
}
