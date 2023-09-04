//
//  AddExerciseView.swift
//  Training
//
//  Created by Bruno dos Santos on 9/4/23.
//

import SwiftUI

struct AddExerciseView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var comments = ""
    
    var body: some View {
        Form {
            Section {
                VStack {
                    TextField("Exercise name", text: $name)
                    TextField("Description", text: $comments)
                }.padding()
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addExercise(name: name, comments: comments, context: managedObjContext)
                        //dismiss()
                    }
                }.padding()
            }
        }
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView()
    }
}
