//
//  ViewExtension.swift
//  Force2.1
//
//  Created by Joseph William DeWeese on 11/14/22.
//



import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
