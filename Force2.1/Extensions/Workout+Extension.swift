//
//  Workout+Extension.swift
//  Force2.1
//
//  Created by Joseph DeWeese on 6/4/23.
//

import Foundation
import CoreData

extension Workout: BaseModel {
   
    static func byMinimumReviewCount(minimumReviewCount: Int = 1) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        //request.predicate = NSPredicate(format: "reviews.@count >= %i", minimumReviewCount)
        request.predicate = NSPredicate(format: "%K.@count >= %i", #keyPath(Workout.reviews) ,minimumReviewCount)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    static func byWorkoutTitle(title: String) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "%K BEGINSWITH[cd] %@", #keyPath(Workout.title), title)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    
    static func byDateRangeOrMinimumRating(lower: Date?, upper: Date?, minimumRating: Int?) -> [Workout] {
        
        var predicates: [NSPredicate] = []
        
        if let lower = lower, let upper = upper {
            
            let dateRangePredicate = NSPredicate(format: "%K >= %@ AND %K <= %@",
                                                            #keyPath(Workout.releaseDate),
                                                            lower as NSDate,
                                                            #keyPath(Workout.releaseDate),
                                                            upper as NSDate)
            
            predicates.append(dateRangePredicate)
            
        } else if let minRating = minimumRating {
            
            let minRatingPredicate = NSPredicate(format: "%K >= %i", #keyPath(Workout.rating), minRating)
            predicates.append(minRatingPredicate)
        }
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    static func byDateRange(lower: Date, upper: Date) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@ AND %K <= %@",
                                        #keyPath(Workout.releaseDate),
                                        lower as NSDate,
                                        #keyPath(Workout.releaseDate),
                                        upper as NSDate
        )
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    
    static func byReleaseDate(releaseDate: Date) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@",#keyPath(Workout.releaseDate), releaseDate as NSDate)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    
    static func byExerciseName(name: String) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "exercises.name CONTAINS %@", name)
        //request.predicate = NSPredicate(format: "%K.name CONTAINS %@", #keyPath(Movie.exercises), name)
        //request.predicate = NSPredicate(format: "%K.%K CONTAINS %@", #keyPath(Movie.exercises), #keyPath(Actor.name), name)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
        
    }
    
}
