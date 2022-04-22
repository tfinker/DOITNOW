//
//  TaskManager.swift
//  DOITNOW
//
//  Created by Yogesh Basavaraju on 22/04/2022.
//


import Foundation
import CoreData


class TaskManager: ObservableObject {
    
    @Published var tasks : [TaskViewManager] = []
    
    var activity: String = ""
    var date = Date()
    
    func save(){
        
        let activities = Tasks (context:CoreDataManager.shared.viewcontext)
        activities.activity = activity
        activities.date = date
        
        CoreDataManager.shared.save()
        
        
    }
    
    func getAllTask() {
        tasks =  CoreDataManager.shared.getAllTask().map(TaskViewManager.init)
    }
    
    struct TaskViewManager {
        let task: Tasks
        var id :NSManagedObjectID {
            return task.objectID
        }
        
        var activity : String {
            return task.activity ?? ""
        }
        
        var date : Date {
            return task.date ?? Date.now
        }
    
    
  }
}

