//
//  Review+Extension.swift
//  Force2.1
//
//  Created by Joseph William DeWeese on 11/14/22.
//

import Foundation
import CoreData

extension Review  {
    
    static func getReviewsByWorkoutId(workoutId: NSManagedObjectID) -> [Review] {
        
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "workout = %@", workoutId)
        
        do {
            return try CoreDataManager.shared.viewContext.fetch(request)
        } catch {
            return []
        }
    }
}
