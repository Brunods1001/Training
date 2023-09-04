//
//  DataController.swift
//  Training
//
//  Created by Bruno dos Santos on 9/4/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    // where all the values are stored
    let container = NSPersistentContainer(name: "ExerciseModel")
    
    // load persistent stores
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            } else {
                print("Description: \(desc)")
            }
        }
    }
    // context is object space to manipulate and track changes to objects
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!!")
        } catch {
            print("We could not save the data....")
        }
    }
    
    // pass context to handle the same data
    func addExercise(name: String, comments: String, context: NSManagedObjectContext) {
        let exercise = Exercise(context: context)
        exercise.id = UUID()
        exercise.name = name
        exercise.comments = comments
        
        save(context: context)
    }
    
    func edit(exercise: Exercise, name: String, comments: String, context: NSManagedObjectContext) {
        exercise.name = name
        exercise.comments = comments
        save(context: context)
    }
}
