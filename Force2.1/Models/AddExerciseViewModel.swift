//
//  AddExerciseViewModel.swift
//  Force2.1
//
//  Created by Joseph William DeWeese on 11/15/22.
//


import Foundation
import CoreData

class AddExerciseViewModel: ObservableObject {

    var name: String = ""
    
    func addExerciseToWorkout(workoutId: NSManagedObjectID) {
        
        let workout: Workout? = Workout.byId(id: workoutId)
        
        if let workout = workout {
            let exercise = Exercise(context: Exercise.viewContext)
            exercise.name = name
            exercise.addToWorkouts(workout)
            
            try? exercise.save()
        }
        
    }
    
}
