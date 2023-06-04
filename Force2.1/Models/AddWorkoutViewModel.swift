//
//  AddWorkoutViewModel.swift
//  Force2.1
//
//  Created by Joseph Wil;liam DeWeese on 11/14/22.
//

import Foundation

class AddWorkoutViewModel: ObservableObject {
    
    var title: String = ""
    var objective: String = ""
    var workoutType: String = ""
    var releaseDate: Date = Date()
    
    func save() {
        
        let manager = CoreDataProvider.shared
        let workout = Workout(context: manager.persistentContainer.viewContext)
        workout.title = title
        workout.objective = objective
        workout.workoutType = workoutType
        workout.releaseDate = releaseDate
        
        manager.save()
    }
    
}
