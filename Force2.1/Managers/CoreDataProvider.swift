//
//  CoreDataManager.swift
//  Force2.1
//
//  Created by Joseph William DeWeese on 11/14/22.
//



import CoreData
import Foundation
import SwiftUI





class CoreDataProvider {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataProvider()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "DailyWorkout")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getWorkoutById(id: NSManagedObjectID) -> Workout? {
        
        do {
            return try persistentContainer.viewContext.existingObject(with: id) as? Workout
        } catch {
            print(error)
            return nil
        }
        
    }
    
    func deleteWorkout(_ workout: Workout) {
        
        persistentContainer.viewContext.delete(workout)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete workout \(error)")
        }
        
    }
    
    func getAllWorkouts() -> [Workout] {
        
        let fetchRequest: NSFetchRequest<Workout> = Workout.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save a workout \(error)")
        }
    }
}


