//
//  MyToggleStyle.swift
//  Chapter_6
//
//  Created by Deforeturn on 12/20/21.
//

import SwiftUI

struct MyToggleStyle: View {
    @State var toggleTurn = false
    @State var toggleTurn2 = false
    var body: some View {
        VStack(spacing: 20){
            Toggle("Hi", isOn: $toggleTurn)
            Toggle("Hi2", isOn: $toggleTurn2)
                .toggleStyle(CustomeToggleStyle())
        }
        .padding(.horizontal, 100)
    }
}

// MARK: -
struct MyToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        MyToggleStyle()
    }
}

struct CustomeToggleStyle: ToggleStyle{
    let size:CGFloat = 20
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        return HStack{
            configuration.label
            Spacer()
            ZStack(alignment: isOn ? .top : .bottom){
                Rectangle()
                    .fill(isOn ? .green : .red)
                    .frame(width: size, height: size * 2)
                Rectangle()
                    .frame(width: size - 2, height: size - 2)
                    .onTapGesture {
                        withAnimation{
                            configuration.isOn.toggle()
                        }
                    }
            }
        }
    }
}
