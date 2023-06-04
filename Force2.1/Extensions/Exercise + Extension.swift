//
//  Exercise + Extension.swift
//  Force2.1
//
//  Created by Joseph Wil;liam DeWeese on 11/15/22.
//

import Foundation
import CoreData

extension Exercise:  BaseModel {
    
    
    static func getExercisesByWorkoutId(workoutId: NSManagedObjectID) -> [Exercise] {
        
        let request: NSFetchRequest<Exercise> = Exercise.fetchRequest()
        request.predicate = NSPredicate(format: "workout = %@", workoutId)
        
        do {
            return try CoreDataProvider.shared.viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
}

