//
//  FiltersViewModel.swift
//  Force2.1
//
//  Created by Joseph DeWeese on 6/4/23.
//

import Foundation

class FiltersViewModel: ObservableObject {
    
    func filterWorkoutsByReleaseDate(releaseDate: Date) -> [WorkoutViewModel] {
        return Workout.byReleaseDate(releaseDate: releaseDate).map(WorkoutViewModel.init)
    }
    
    func filterWorkoutsByDateRange(lowerBoundDate: Date, upperBoundDate: Date) -> [WorkoutViewModel] {
        return Workout.byDateRange(lower: lowerBoundDate, upper: upperBoundDate).map(WorkoutViewModel.init)
    }
    
    func filterWorkoutsByDateRangeOrMinimumRating(lowerBoundDate: Date?, upperBoundDate: Date?, minimumRating: Int?) -> [WorkoutViewModel] {
            return Workout.byDateRangeOrMinimumRating(lower: lowerBoundDate, upper: upperBoundDate, minimumRating: minimumRating).map(WorkoutViewModel.init)
        }
    
    func filterWorkoutsByTitle(title: String) -> [WorkoutViewModel] {
            return Workout.byWorkoutTitle(title: title).map(WorkoutViewModel.init)
    }
    
    func filterWorkoutsByExerciseName(name: String) -> [WorkoutViewModel] {
        return Workout.byExerciseName(name: name).map(WorkoutViewModel.init)
    }
    
    func filterWorkoutsByMinimumReviewCount(minimumReviewCount: Int = 0) -> [WorkoutViewModel] {
        return Workout.byMinimumReviewCount(minimumReviewCount: minimumReviewCount).map(WorkoutViewModel.init)
    }
    
}
