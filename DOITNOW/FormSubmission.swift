//
//  SubmissionForm.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/13/22.
//

import SwiftUI


struct SubmissionForm: View {
    @StateObject private var activityList = TaskManager()

    
    enum SportOptions: String, CaseIterable, Identifiable {
        case Walk
        case Run
        case Cycle
        
        var id: SportOptions { self }
    }
    @State private var selectedSport = SportOptions.Walk
    @State private var datePicked = Date()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .top) {
            
            Background()
            
            VStack {
                Title(title: "PLAN IT NEW!")
                
                Picker("Please choose a sport", selection: $selectedSport) {
                    ForEach(SportOptions.allCases, content: { sport in Text(sport.rawValue.capitalized)
                    })
                }
                .padding(.all)
                .pickerStyle(SegmentedPickerStyle())
                
                DatePicker(selection: $datePicked, in: Date()...Date().addingTimeInterval(608400), displayedComponents: .date) {
                        Text("Select a date")
                    }
                    .padding(.horizontal)
                    .datePickerStyle(
                        GraphicalDatePickerStyle()
                    )
                
                Spacer()
            }
            .navigationBarItems(trailing:
                Button("Submit") {
                activityList.activity = selectedSport.rawValue
                activityList.date = datePicked
                activityList.save()
                self.presentationMode.wrappedValue.dismiss()
            }.buttonStyle(.borderedProminent))
        }
    }
}



struct SubmissionForm_Previews: PreviewProvider {
    static var previews: some View {
        SubmissionForm()
    }
}
