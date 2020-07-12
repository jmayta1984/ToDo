//
//  TaskViewModel.swift
//  ToDo
//
//  Created by Jorge Mayta Guillermo on 7/12/20.
//  Copyright © 2020 Cibertec. All rights reserved.
//

import FirebaseFirestore

class TaskViewModel: ObservableObject {
    
    @Published var tasks = [Task]()
    
    private var db = Firestore.firestore()
    
    func addTask(name: String){
        
        let task = Task(id: UUID().uuidString, name: name)
        let _ = try? db.collection("tasks").addDocument(from: task)
        
    }
    
    
    func deleteTask(index: Int){
    
        db.collection("tasks").document(tasks[index].id!).delete()
    
    }
    
    func getTasks(){
        
        db.collection("tasks").addSnapshotListener { (result, error) in
            if let querySnapshot = result {
                self.tasks = querySnapshot.documents.compactMap{
                    document -> Task? in
                    try? document.data(as: Task.self)
                    
                }
            }
        }
        
    }
    
}
