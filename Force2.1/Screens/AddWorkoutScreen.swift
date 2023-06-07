//
//  AddWorkoutScreen.swift
//  Force2.1
//
//  Created by Joseph William DeWeese on 11/14/22.
//

import SwiftUI

struct AddWorkoutScreen: View {
    //MARK:   PROPERTIES
    @StateObject private var addWorkoutVM = AddWorkoutViewModel()
    @Environment(\.presentationMode) var presentationMode
    //MARK:  WORKOUT TYPES COLORIZATION
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
        Form {
            //MARK:  WORKOUT NAME AND DESCRIPTTION
            Section(header: Text("Add/Edit Workout Details").fontWeight(.bold).foregroundColor(.primary)){
                
                TextField("Enter name of workout...", text: $addWorkoutVM.title)
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                    .cornerRadius(10)
                    .foregroundColor(.primary)
                
                Section(header: Text("Workout Description/Objective").fontWeight(.bold).foregroundColor(.primary)) {
                    TextEditor(text: $addWorkoutVM.objective)
                        .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(5)
                        .padding(2)
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .foregroundColor(.primary)
                }
                //exercise
            }
            //MARK:  WORKOUT TYPE PICKER
            Picker("Workout Type:", selection: $addWorkoutVM.workoutType) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
                .pickerStyle(.automatic)
            }
            .foregroundColor(.primary)
            HStack {
                Text("Instensity Rating:")
            }
            RatingView(rating: $addWorkoutVM.rating)
            //MARK:  DATE PICKER
            DatePicker("Date", selection: $addWorkoutVM.releaseDate)
            
            //MARK:  SAVE BUTTON
            Button("Save"){
                HapticManager.notification(type: .success)
                addWorkoutVM.save()
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(minWidth: 300, maxWidth: .infinity, minHeight: 50, maxHeight: 75)
            .background(.blue)
            .cornerRadius(10)
            .navigationTitle("Add Workout")
        }
        .embedInNavigationView()
    }
}

struct AddWorkoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutScreen()
    }
}
