//
//  WorkoutListViewModel.swift
//  Force2.1
//
//  Created by Joseph Wil;liam DeWeese on 11/14/22.
//

import Foundation
import CoreData
import SwiftUI

class WorkoutListViewModel: ObservableObject {
    
    @Published var workouts = [WorkoutViewModel]()
    
    func deleteWorkout(workout: WorkoutViewModel) {
        let workout: Workout? = Workout.byId(id: workout.workoutId)
        if let workout = workout {
            try? workout.delete()
        }
    }
    
    func getAllWorkouts() {
        
        DispatchQueue.main.async {
            self.workouts = Workout.all().map(WorkoutViewModel.init)
        }
    }
}

struct WorkoutViewModel {
    
    let workout: Workout
    
    var workoutId: NSManagedObjectID {
        return workout.objectID
    }
    
    var title: String {
        return workout.title ?? ""
    }
    
    var objective: String {
        return workout.objective ?? "Not available"
    }
    var workoutType: String {
        return workout.workoutType ?? "Not available"
    }
    
    var releaseDate: String? {
        return workout.releaseDate?.asFormattedString()
    }
    var rating: Int? {
        return Int(workout.rating)
    }
}
