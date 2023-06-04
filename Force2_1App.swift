//
//  Force2_1App.swift
//
//  Created by Joseph William DeWeese on 11/14/22.
//

import SwiftUI

@main
struct Force2_1App: App {
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    var body: some Scene {
        WindowGroup {
            WorkoutListScreen()
        }
    }
}
