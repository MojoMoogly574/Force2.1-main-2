//
//  ShowFilterScreen.swift
//  Force2.1
//
//  Created by Joseph DeWeese on 6/4/23.
//

import SwiftUI

struct ShowFiltersScreen: View {
    
    @State private var releaseDate: String = ""
    @State private var startDate: String = ""
    @State private var endDate: String = ""
    @State private var minimumRating: String = ""
    @State private var workoutTitle: String = ""
    @State private var exerciseName: String = ""
    @State private var minimumReviewCount: String = "1"
    
    @Binding var workouts: [WorkoutViewModel]
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var filtersVM = FiltersViewModel()
    
    var body: some View {
        Form {
            
            Section(header: Text("Search by release date")) {
                TextField("Enter release date", text: $releaseDate)
                HStack {
                    Spacer()
                    Button("Search") {
                        
                        if let releaseDate = releaseDate.asDate() {
                           workouts =  filtersVM.filterWorkoutsByReleaseDate(releaseDate: releaseDate)
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search by date range")) {
                TextField("Enter start date", text: $startDate)
                TextField("Enter end date", text: $endDate)
                HStack {
                    Spacer()
                    Button("Search") {
                        
                        guard let lowerBound = startDate.asDate(),
                              let upperBound = endDate.asDate() else {
                            return
                        }
                        
                        workouts =  filtersVM.filterWorkoutsByDateRange(lowerBoundDate: lowerBound, upperBoundDate: upperBound)
                        
                        presentationMode.wrappedValue.dismiss()
                       
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search by date range or rating")) {
                TextField("Enter start date", text: $startDate)
                TextField("Enter end date", text: $endDate)
                TextField("Enter minimum rating", text: $minimumRating)
                HStack {
                    Spacer()
                    Button("Search") {
                        
                        let lowerBound = startDate.asDate()
                        let upperBound = endDate.asDate()
                        let minRating = Int(minimumRating)
                        
                        workouts =  filtersVM.filterWorkoutsByDateRangeOrMinimumRating(lowerBoundDate: lowerBound, upperBoundDate: upperBound, minimumRating: minRating)
                        
                        presentationMode.wrappedValue.dismiss()
                        
                       
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search by workout, title begins with")) {
                TextField("Enter workout title", text: $workoutTitle)
                HStack {
                    Spacer()
                    Button("Search") {
                        
                        workouts = filtersVM.filterWorkoutsByTitle(title: workoutTitle)
                        presentationMode.wrappedValue.dismiss()
                        
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search by exercise name")) {
                TextField("Enter exercise name", text: $exerciseName)
                HStack {
                    Spacer()
                    Button("Search") {
                        
                        workouts = filtersVM.filterWorkoutsByExerciseName(name: exerciseName)
                        presentationMode.wrappedValue.dismiss()
                        
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search workouts by minimum review count")) {
                TextField("Enter minimum review count", text: $minimumReviewCount)
                HStack {
                    Spacer()
                    Button("Search") {
                        
                        if !minimumReviewCount.isEmpty {
                            workouts =  filtersVM.filterWorkoutsByMinimumReviewCount(minimumReviewCount: Int(minimumReviewCount) ?? 0)
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
        }
        .navigationTitle("Filters")
        .embedInNavigationView()
    }
}

struct ShowFiltersScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShowFiltersScreen(workouts: .constant([WorkoutViewModel(workout: Workout())]))
    }
}
