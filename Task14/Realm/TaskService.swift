//
//  TaskService.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import Foundation
import RealmSwift

class TaskService {
    var realm: Realm
    
    static var shared: TaskService = {
        let instance = TaskService()
         
        return instance
    }()
    
    private init() {
        try! realm = Realm()
    }
    
    func delete(task: Task) {
        try! realm.write {
            realm.delete(task)
        }
    }
    
    func findAll() -> Results<Task> {
        realm.objects(Task.self)
    }
    
    func save(task: Task) {
        try! realm.write {
            realm.add(task)
        }
    }
}
