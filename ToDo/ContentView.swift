//
//  ContentView.swift
//  ToDo
//
//  Created by Jorge Mayta Guillermo on 7/12/20.
//  Copyright © 2020 Cibertec. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @ObservedObject var taskVM = TaskViewModel()
    
    var body: some View {
        List{
            Section (header: Text("Tarea")){
                HStack {
                    TextField("Ingrese nueva tarea", text: $name)
                    Button(action: {
                        self.taskVM.addTask(name: self.name)
                    }){
                        Image(systemName: "plus")
                    }
                }
            }
            Section (header: Text("Tareas")){
                ForEach(self.taskVM.tasks) { task in
                    Text(task.name)
                }.onDelete { indexSet in
                    self.taskVM.deleteTask(index: indexSet.first!)
                }
            }
        }.onAppear{
            self.taskVM.getTasks()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
