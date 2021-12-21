//
//  MyContentOffset.swift
//  Chapter_7
//
//  Created by Deforeturn on 12/21/21.
//

import SwiftUI

struct MyContentOffset: View {
    var body: some View {
//        ScrollView{
//            ForEach(0..<10) { _ in
//                GeometryReader {
//                    Rectangle()
//                        .fill(self.color(from: $0))
//                }
//                .frame(height: 150)
//            }
//        }
        geoPage()
    }
    func color(from proxy:GeometryProxy) -> Color{
        let yOffset = proxy.frame(in: .global).minY - 44
        print(yOffset)
        let color = min(1, 0.2 + Double(yOffset / 1000))
        return Color(hue: color, saturation: color, brightness: color)
    }
    func geoPage() -> some View{
        let colors:[Color] = [.red, .green, .blue, .indigo]
        return GeometryReader { proxy in
            ScrollView(.horizontal){
                HStack(spacing:0){
                    ForEach(colors.indices){index in
                        Circle()
                            .fill(colors[index])
                            .overlay(Text("\(index) page.")
                                        .font(.largeTitle).foregroundColor(.white))
                            
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
            }
            .onAppear {UIScrollView.appearance().isPagingEnabled = true}
        }
    }
}

struct MyContentOffset_Previews: PreviewProvider {
    static var previews: some View {
        MyContentOffset()
    }
}
