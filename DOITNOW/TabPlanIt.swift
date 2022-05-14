//
//  planit.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/19/22.
//

import SwiftUI
import MapKit

struct TabPlanIt: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    @StateObject private var activityList = TaskManager()
    
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
                       Spacer()
                        
                        NavigationLink(destination: SubmissionForm()) {
                            Text("Add")
                                .font(.title)
                                
                            }
                        .foregroundColor(.blue)
                        
                        
                        List{
                            
                        ForEach(activityList.tasks, id: \.id){
                            task in
                            VStack{
                                Text(task.activity)
                                    .font(.title)
                            Text(task.date, format: Date.FormatStyle(date: .numeric))
                                    .font(.subheadline)
                            }
                        }.onDelete(perform: deleteactivity)
                        }

                       
                   }
                    .navigationBarTitle("PLAN IT NOW!", displayMode: .automatic)
                
                   .foregroundColor(.blue)
                        
               }.onAppear{activityList.getAllTask()}
                  
            }
        }
        
    




struct planit_Previews: PreviewProvider {
    static var previews: some View {
        TabPlanIt()
    }
}
}
