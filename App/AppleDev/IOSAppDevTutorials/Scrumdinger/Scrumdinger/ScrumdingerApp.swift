//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Deforeturn on 11/30/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.data)
            }
        }
    }
}
