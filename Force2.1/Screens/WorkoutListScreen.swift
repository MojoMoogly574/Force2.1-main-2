//
//  WorkoutListScreen.swift
//  Force2.1
//
//  Created by Joseph William DeWeese on 11/14/22.
//

import SwiftUI

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addWorkout
    case showFilters
}

struct WorkoutListScreen: View {
    //MARK:  PROPERTIES
    @StateObject private var workoutListVM = WorkoutListViewModel()
    @State private var activeSheet: Sheets?
    @State private var filterApplied: Bool = false
    
    private func deleteWorkout(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let workout = workoutListVM.workouts[index]
            // delete the workout
            workoutListVM.deleteWorkout(workout: workout)
            // get all workouts
            workoutListVM.getAllWorkouts()
        }
    }
    let types = ["Strength", "Power", "Cardio", "HIIT", "Recover", "Yoga"]
    func colorize(type: String) -> Color {
        switch type {
        case "HIIT":
            return .blue
        case "Recover":
            return .teal
        case "Strength":
            return .orange
        case "Cardio":
            return .red
        case "Power":
            return .cyan
        case "Yoga":
            return .green
        default:
            return .gray
            
        }
    }
    var body: some View {
        
        
            VStack {
                //MARK:  SEARCH FILTER
                HStack {
                    Button("Reset") {
                        workoutListVM.getAllWorkouts()
                    }
                    .padding()
                    Spacer()
                    Button("Search") {
                        filterApplied = true
                        activeSheet = .showFilters
                    }
                }
                .foregroundColor(.blue)
                .padding(.trailing, 40)
                
            List{
                ForEach(workoutListVM.workouts, id:  \.workoutId) { workout in
                    NavigationLink(destination: DetailScreen()){
                        CardView(workout: workout)
                    }
                    .cornerRadius(12)
                .padding(7)
                    //    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .bottom, endPoint: .top))
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),self.colorize(type: workout.workoutType)]), startPoint: .bottom, endPoint: .top).opacity(0.4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(self.colorize(type: workout.workoutType ), lineWidth: 8.0))
                    .padding(.top, 2)
                }
                .onDelete(perform: deleteWorkout)
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Daily Workouts")
            .navigationBarItems(
                trailing:
                    //MARK:  ADD WORKOUT BUTTON
                Button {
                    activeSheet = .addWorkout
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 40, height: 40)
                        .background(Color.blue,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(color: .black.opacity(0.4), radius: 10, x: 10, y: 3)
                })
            .sheet(item: $activeSheet, onDismiss: {
                if(!filterApplied) {
                    workoutListVM.getAllWorkouts()
                }
            }, content: { item in
                switch item {
                case .addWorkout:
                    AddWorkoutScreen()
                case .showFilters:
                    ShowFiltersScreen(workouts: $workoutListVM.workouts)
                }
            })
            .onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
                UITableView.appearance().separatorColor = .clear
                if !filterApplied {
                    workoutListVM.getAllWorkouts()
                }
            })
        }
        .embedInNavigationView()
    }
}
struct WorkoutListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListScreen()
    }
}
struct CardView: View {
    //MARK:  PROPERTIES
    let workout: WorkoutViewModel
    func colorize(type: String) -> Color {
        switch type {
        case "HIIT":
            return .blue
        case "Recover":
            return .teal
        case "Strength":
            return .orange
        case "Cardio":
            return .red
        case "Power":
            return .cyan
        case "Yoga":
            return .green
        default:
            return .gray
            
        }
    }
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(workout.title)
                    .foregroundColor(.white)
                    .accessibilityAddTraits(.isHeader)
                    .font(.body)
                    .fontWeight(.bold)
                Text(workout.objective)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                HStack {
                Text(workout.releaseDate ?? "")
                .font(.footnote)
              Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(workout.rating!)")
                }
            }
            .padding(.all)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(self.colorize(type: workout.workoutType ), lineWidth: 4))
            
                    Spacer()
               
                    Text(workout.workoutType)
                        .padding(4)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .accessibilityLabel("Workout type\(workout.workoutType) ")
                        .font(.caption)
                        .overlay(
                            Capsule().stroke(self.colorize(type: workout.workoutType ), lineWidth: 4))
                    
                }
        .padding(5)
            }
           
        }

