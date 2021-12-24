//
//  ContentView.swift
//  Chapter_10
//
//  Created by Deforeturn on 12/24/21.
//

import SwiftUI

struct MyForm: View {
    
    @State private var brightness = CGFloat(0.5)
    @State private var isTrueTone = true
    @State private var canRaiseToWake = true
    @State private var autoLock = "30 Seconds"
    private let autoLockOptions = ["30 Seconds", "2 Minute", "Never"]
    
    var body: some View {
        NavigationView{
            Form{
                Section(
                    header: Text("밝기"),
                    footer: Text("iphone 디스플레이를 주변광에 맞춰 색상이 일관되게 보이도록 조정함.")
                ){
                    Slider(
                        value: $brightness,
                        minimumValueLabel: Image(systemName: "sun.min.fill"),
                        maximumValueLabel: Image(systemName: "sun.max.fill")
                    ){
                        Text("밝기 조정")
                    }
                    Toggle("True Tone", isOn: $isTrueTone)
                }
                Section(){
                    Picker("자동 잠금", selection: $autoLock){
                        ForEach(autoLockOptions, id: \.self){
                            Text($0)
                        }
                    }
                    Toggle("들어서 깨우기", isOn: $canRaiseToWake)
                }
            }
            .navigationBarTitle("디스플레이 및 밝기", displayMode: .inline)
        }
    }
}

struct MyForm_Previews: PreviewProvider {
    static var previews: some View {
        MyForm()
    }
}
