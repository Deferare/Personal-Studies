//
//  MyPreview.swift
//  Chapter_11
//
//  Created by Deforeturn on 12/28/21.
//

import SwiftUI

//struct MyPreview: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

final class ViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundView = UIView()
        backgroundView.frame.size = view.frame.size.applying(.init(scaleX: 0.6, y: 0.3))
        backgroundView.center = view.center
        backgroundView.backgroundColor = .darkGray
        view.addSubview(backgroundView)
        
        let label = UILabel()
        label.text = "Hello SwiftUI!"
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
    }
}


struct MyPreview_Previews: PreviewProvider, UIViewControllerRepresentable {
    static var previews: some View {
        MyPreview_Previews()
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}
//extension MyPreview_Previews: UIViewControllerRepresentable{
//    func makeUIViewController(context: Context) -> some UIViewController {
//        ViewController()
//    }
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//
//
//}
