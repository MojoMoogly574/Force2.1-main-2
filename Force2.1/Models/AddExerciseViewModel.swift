//
//  AddExerciseViewModel.swift
//  Force2.1
//
//  Created by Joseph William DeWeese on 11/15/22.
//

import Foundation
import CoreData


import Foundation
import CoreData

class ExerciseListViewModel: ObservableObject {
    
   @Published var exercises = [ExerciseViewModel]()
    
    func getExercisesByWorkout(vm: WorkoutViewModel) {
        DispatchQueue.main.async {
            self.exercises = Exercise.getExercisesByWorkoutId(workoutId: vm.id).map(ExerciseViewModel.init)
        }
    }
    
}

struct ExerciseViewModel {
    
    let exercise: Exercise
    
    var exerciseId: NSManagedObjectID {
        return exercise.objectID
    }
    
    var name: String {
        return exercise.name ?? ""
    }
    
    var workouts: [WorkoutViewModel] {
        return Workout.byExerciseName(name: name).map(WorkoutViewModel.init)
    }
   
}

