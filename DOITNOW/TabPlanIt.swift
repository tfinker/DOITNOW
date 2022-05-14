//
//  planit.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/19/22.
//

import SwiftUI
import MapKit

struct TabPlanIt: View {
    
    @ObservedObject var activityList: TaskManager;
    @State var subFormActive = false;
    
    func deleteactivity ( at offsets: IndexSet){
        offsets.forEach { index in
            let activity = activityList.tasks[index]
            activityList.delete(activity)
        }
        activityList.getAllTask()
    }
   
    var body: some View {

        NavigationView {
            ZStack{
                Background()
                
                VStack{
                    Title(title: "PLAN IT NOW!")
                    Spacer()
                    if activityList.emptyList {
                        Text("Press Add to submit a new activity")
                        Spacer()
                    }
                    else {
                        List{
                            ForEach(activityList.tasks, id: \.id){
                                task in
                                VStack{
                                    Text(task.activity)
                                        .font(.title)
                                    Text(task.date, format: Date.FormatStyle(date: .numeric))
                                            .font(.subheadline)
                                }
                            }
                            .onDelete(perform: deleteactivity)
                        }
                        .onAppear{UITableView.appearance().backgroundColor = .clear}
                    }
                    Spacer()
                }
                .navigationBarItems(trailing:
                    NavigationLink(destination: SubmissionForm(activityList: activityList), isActive: $subFormActive) {
                        Button("Add") {
                            subFormActive=true;
                        }.buttonStyle(.borderedProminent)
                    })
                        
            }.onAppear{activityList.getAllTask()}
            .onAppear{activityList.getNextActivity()}
        }
    }
}
    




//struct planit_Previews: PreviewProvider {
//    static var previews: some View {
//        TabPlanIt()
//    }
//}
//}
