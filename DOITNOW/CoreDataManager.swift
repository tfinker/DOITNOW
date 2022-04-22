//
//  CoreDataManager.swift
//  DOITNOW
//
//  Created by Yogesh Basavaraju on 22/04/2022.
//

import Foundation
import CoreData

class CoreDataManager{
    
    
    let persistentContainer: NSPersistentContainer
    
    static  let shared = CoreDataManager()
    
    var viewcontext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
        func save(){
            do{
              return try viewcontext.save()
            } catch {
                viewcontext.rollback()
                print(error.localizedDescription)
                
            }
        }
    
    
    func getAllTask() -> [Tasks]{
        
        let request: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        do{
            return try  viewcontext.fetch(request)
        }catch {
            return []
        }
    }
    
    private init(){
       persistentContainer = NSPersistentContainer(name: "CoreDataModel")
       persistentContainer.loadPersistentStores{(description, error) in
           if let error = error {
               fatalError("Unable to initialise core data Stack \(error)")

           }
       }
    }
}

