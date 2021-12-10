//
//  MyEnvironment.swift
//  Chapter_4
//
//  Created by Deforeturn on 12/10/21.
//

import SwiftUI

struct MyEnvironment: View {
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.timeZone) var timeZ
    @Environment(\.myEnv) var customEnv
    var body: some View {
        VStack{
            if layoutDirection == .leftToRight{
                Text("Left to Right")
            }else{
                Text("Right to Left")
            }
            Text("\(timeZ)")
            Text("\(customEnv)")
        }
    }
}

struct MyEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        MyEnvironment()
    }
}


struct MyEnvironmentData: EnvironmentKey{
    static let defaultValue: Int = 0
}

extension EnvironmentValues{
    var myEnv: Int {
        get{self[MyEnvironmentData.self]}
        set{self[MyEnvironmentData.self] = newValue}
    }
}
