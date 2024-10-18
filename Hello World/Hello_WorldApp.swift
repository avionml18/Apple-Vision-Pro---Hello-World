//
//  Hello_WorldApp.swift
//  Hello World
//
//  Created by Avion Lowery on 10/11/24.
//

import SwiftUI


@main
struct Hello_WorldApp: App {
    // App is presented within the application when you open the APV
    var body: some Scene {
        WindowGroup {
            ContentView()
            // This is what the user can interact with
        }
        .windowStyle(.volumetric)
        
        //This will be a space opened by clicking on the app by default
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
