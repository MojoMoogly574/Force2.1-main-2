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
    @Published var rating: Int? = nil
    var releaseDate: Date = Date()
    
    func save() {
        
        let workout = Workout(context: Workout.viewContext)
        workout.title = title
        workout.objective = objective
        workout.workoutType = workoutType
        workout.rating = Double(rating ?? 0)
        workout.releaseDate = releaseDate
        
        try? workout.save()
    }
    
}
