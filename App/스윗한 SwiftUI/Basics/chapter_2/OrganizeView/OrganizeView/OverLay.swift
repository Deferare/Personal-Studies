//
//  OverLay.swift
//  OrganizeView
//
//  Created by Deforeturn on 12/7/21.
//

import SwiftUI

struct OverLay: View {
    var body: some View {
        VStack {
            Rectangle().fill(.green).frame(width: 150, height: 150)
                .overlay(){
                    Rectangle().fill(.yellow).offset(x: 10, y: 10)
                }
            Rectangle().fill(.red).frame(width: 150, height: 150)
                .background(){
                    Rectangle().fill(.cyan).offset(x: 10, y: 10)
                }
        }
    }
}

struct OverLay_Previews: PreviewProvider {
    static var previews: some View {
        OverLay()
    }
}
