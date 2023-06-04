//
//  DetailScreen.swift
//  Force2.1
//
//  Created by Joseph William DeWeese on 11/14/22.
//

import SwiftUI

struct DetailScreen: View {
    
    @StateObject private var addWorkoutVM = AddWorkoutViewModel()
    @StateObject private var addExerciseVM = ExerciseListViewModel()
    @Environment(\.presentationMode) var presentationMode
    let types = ["Strength", "Power", "Cardio", "HIIT", "Recover"]
    func colorize(type: String) -> Color {
        switch type {
            case "HIIT":
                return .blue
            case "Recover":
                return .indigo
            case "Strength":
                return .orange
            case "Cardio":
                return .red
            case "Power":
                return .green
            default:
                return .gray
                
        }
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
