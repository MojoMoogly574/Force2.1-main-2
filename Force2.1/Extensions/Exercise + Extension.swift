//
//  Exercise + Extension.swift
//  Force2.1
//
//  Created by Joseph Wil;liam DeWeese on 11/15/22.
//

import Foundation
import CoreData

extension Exercise:  BaseModel {
    
    @objc(addWorkoutsObject:) @NSManaged func addToWorkouts(_ value: Workout)
  
    static func getExercisesByWorkoutId(workoutId: NSManagedObjectID) -> [Exercise] {

        guard let workout = Workout.byId(id: workoutId) as? Workout,
              let exercises = workout.exercises
        else {
            
            return []
        }
        return (exercises.name as? [Exercise]) ?? [ ]
    }
}
