//
//  MySelectionTabView.swift
//  Chapter_7
//
//  Created by Deforeturn on 12/21/21.
//

import SwiftUI

struct MySelectionTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab){
            ForEach(0..<3){index in
                Text("Tag \(index)")
                    .font(.largeTitle).fontWeight(.bold)
                    .tag(index)
                    .tabItem{
                        Image(systemName: "\(selectedTab).square.fill")
                            .imageScale(.large)
                    }
            }
        }
    }
}

struct MySelectionTabView_Previews: PreviewProvider {
    static var previews: some View {
        MySelectionTabView()
    }
}
