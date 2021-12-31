//
//  LandMarkApp.swift
//  LandMark
//
//  Created by Deforeturn on 12/20/21.
//

import SwiftUI

@main
struct LandMarkApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
