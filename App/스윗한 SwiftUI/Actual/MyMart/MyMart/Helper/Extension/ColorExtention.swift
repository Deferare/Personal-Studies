//
//  ColorExtention.swift
//  MyMart
//
//  Created by Deforeturn on 12/7/21.
//

import SwiftUI

extension Color{
    static let peach = Color("peach") // 웹 메인 색.
    static let primaryShadow = Color.primary.opacity(0.2) // 그림자에 사용 할 색.
    static let secondaryText = Color(hex: "#6e6e6e")
    static let background = Color(UIColor.systemGray6)
}

extension Color {
    init(hex: String){
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb:UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red:r, green: g, blue: b)
    }
}
