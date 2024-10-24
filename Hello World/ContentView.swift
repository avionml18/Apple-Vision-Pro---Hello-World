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
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
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
                
                Button("Open") {
                    Task {
                        await openImmersiveSpace(id: "ImmersiveSpace")
                    }
                }
            }
            .padding()
            .glassBackgroundEffect()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ImmersiveView()
            .previewLayout(.fixed3D(width:1000,
                                    height:1000,
                                    depth:1000))
        // These numberes are a measurements. Divide the number by 10, and then your in centimeters
    }

}
