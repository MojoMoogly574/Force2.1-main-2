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
    
    func filterMoviesByDateRange(lowerBoundDate: Date, upperBoundDate: Date) -> [WorkoutViewModel] {
        return Workout.byDateRange(lower: lowerBoundDate, upper: upperBoundDate).map(WorkoutViewModel.init)
    }
    
    func filterMoviesByDateRangeOrMinimumRating(lowerBoundDate: Date?, upperBoundDate: Date?, minimumRating: Int?) -> [WorkoutViewModel] {
            return Workout.byDateRangeOrMinimumRating(lower: lowerBoundDate, upper: upperBoundDate, minimumRating: minimumRating).map(WorkoutViewModel.init)
        }
    
    func filterMoviesByTitle(title: String) -> [WorkoutViewModel] {
            return Workout.byWorkoutTitle(title: title).map(WorkoutViewModel.init)
    }
    
    func filterMoviesByActorName(name: String) -> [WorkoutViewModel] {
        return Workout.byExerciseName(name: name).map(WorkoutViewModel.init)
    }
    
    func filterMoviesByMinimumReviewCount(minimumReviewCount: Int = 0) -> [WorkoutViewModel] {
        return Workout.byMinimumReviewCount(minimumReviewCount: minimumReviewCount).map(WorkoutViewModel.init)
    }
    
}
