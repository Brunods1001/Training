//
//  ListExerciseView.swift
//  Training
//
//  Created by Bruno dos Santos on 9/4/23.
//

import SwiftUI
import CoreData

struct ListExerciseView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name, order: .reverse), SortDescriptor(\.comments, order: .reverse)]) var exercises: FetchedResults<Exercise>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if exercises.isEmpty {
                    Text("No exercises found.")
                } else {
                    Text("Number of exercises registered: \(numberOfExercises())")
                    
                    List(exercises, id: \.id) { exercise in
                        Text(exercise.name ?? "Unknown Exercise")
                    }
                }
            }
            .navigationTitle("Exercises")
        }
    }
    
    private func numberOfExercises() -> Int {
        return exercises.count
    }

}

struct ListExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ListExerciseView()
    }
}
