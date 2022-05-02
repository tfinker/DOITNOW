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
    @Published var nextActivity: TaskViewManager?
    @Published var nextTask: String?
    @Published var nextDate: Date?
    @Published var emptyList: Bool = false
 
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

    func getNextActivity(){
        if tasks.count > 0 {
            for task in tasks {
                if nextActivity == nil{
                    nextActivity = task
                }else{
                    if task.date < nextActivity!.date{
                    nextActivity = task
                    }
                }
            if nextActivity != nil{
                nextTask = nextActivity!.activity
                nextDate = nextActivity!.date
            }
            }
        }else{
            emptyList = true
        }
    }

    struct TaskViewManager: Identifiable {
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


