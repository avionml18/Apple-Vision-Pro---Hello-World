//
//  ImmersiveView.swift
//  Hello World
//
//  Created by Avion Lowery on 10/18/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

//struct ImmersiveView: View {
//    var body: some View {
//        RealityView { content in
//            if let scene = try? await loadScene() {
//                content.add(scene)
//            }
//        }
//    }
//    
//    private func loadScene() async throws -> Entity {
//        return try await Entity(named: "ImmersiveScene", in: realityKitContentBundle)
//    }
//}

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "ImmersiveScene", in: realityKitContentBundle) {
                content.add(scene)
            }
        }
    }
}

struct ImmersiveView_Previews: PreviewProvider {
    static var previews: some View {
        ImmersiveView()
            .previewLayout(.sizeThatFits)
    }

}
