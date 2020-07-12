//
//  Task.swift
//  ToDo
//
//  Created by Jorge Mayta Guillermo on 7/12/20.
//  Copyright © 2020 Cibertec. All rights reserved.
//
import FirebaseFirestoreSwift

struct Task: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
}
