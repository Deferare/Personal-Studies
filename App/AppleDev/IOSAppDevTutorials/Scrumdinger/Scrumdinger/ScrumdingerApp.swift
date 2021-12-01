//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Deforeturn on 11/30/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
