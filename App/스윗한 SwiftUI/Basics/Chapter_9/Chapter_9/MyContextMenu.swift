//
//  MyContextMenu.swift
//  Chapter_9
//
//  Created by Deforeturn on 12/23/21.
//

import SwiftUI

struct MyContextMenu: View {
    @State private var toDoList = Array(1...10).map(Todo.init(id:))
    var body: some View {
        List(Array(toDoList.enumerated()), id: \.offset){ (index, toDo) in
            HStack{
                Text("\(toDo.title) \(toDo.id)")
                Spacer()
                Text(toDo.isCompleted ? "O" : "")
            }
            .font(.title)
            .frame(height: 50)
            .contextMenu(){
                Button("Done") {self.toDoList[index].isCompleted = true}
                Button("Remove") {self.toDoList.remove(at: index)}
            }
        }
    }
}

struct Todo{
    let id:Int
    let title:String = "To Do"
    var isCompleted = false
    init(id: Int) {
        self.id = id
    }
}

struct MyContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        MyContextMenu()
    }
}
