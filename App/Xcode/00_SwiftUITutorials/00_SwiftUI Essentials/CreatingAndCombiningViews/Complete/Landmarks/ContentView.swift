// SwiftUI 옵션은 기본적으로 ContentsView와 Contents_Previews 두가지를 제공함.

import SwiftUI

// 레이아웃과 뷰의 구조에 대한 선언.
struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges:.top)
                .frame(height:300)
            CircleImage()
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack (alignment: .leading){
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Derforeturn")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
            
        }

    }
}

// 미리보기에 대한 선언.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
