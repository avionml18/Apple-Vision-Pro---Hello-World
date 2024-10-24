//
//  ImmersiveView.swift
//  Hello World
//
//  Created by Avion Lowery on 10/18/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


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
            .previewLayout(.fixed3D(width:1000,
                                    height:1000,
                                    depth:1000))
        // These numberes are a measurements. Divide the number by 10, and then your in centimeters
    }

}
