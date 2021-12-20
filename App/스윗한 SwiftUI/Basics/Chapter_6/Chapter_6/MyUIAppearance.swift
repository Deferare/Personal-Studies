//
//  MyUIAppearance.swift
//  Chapter_6
//
//  Created by Deforeturn on 12/20/21.
//

import SwiftUI

struct MyUIAppearance: View {
    @State var turn = true
    var body: some View {
        NavigationView{
            VStack{
                Text("Hi")
                    .navigationBarTitle("UIAppearance")
                    .onAppear{
                        UINavigationBar.appearance().largeTitleTextAttributes = [
                            .foregroundColor: UIColor.systemTeal,
                            .kern:5]
                    }
                Toggle(isOn: $turn){
                    Text("Change the color of the UISwitch.")
                    .onAppear{
                        UISwitch.appearance().onTintColor = .red
                        UISwitch.appearance().thumbTintColor = .blue
                    }
                }
                Toggle(isOn: $turn){
                    Text("클래스와 관련된 모든 뷰에 적용됨.")
                }
            }
        }
    }
}

struct MyUIAppearance_Previews: PreviewProvider {
    static var previews: some View {
        MyUIAppearance()
    }
}
