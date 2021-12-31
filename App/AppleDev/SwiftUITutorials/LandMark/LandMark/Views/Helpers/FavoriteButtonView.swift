//
//  FavoriteButtonView.swift
//  LandMark
//
//  Created by Deforeturn on 12/31/21.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Binding var isSet:Bool
    var body: some View {
        Button{
            isSet.toggle()
        }label:{
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(isSet: .constant(true))
    }
}
