//
//  planit.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/19/22.
//

import SwiftUI

struct TabPlanIt: View {
    @StateObject private var activityList = TaskManager()
   
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .top) {
                
                
                Background()
                
               
                
                VStack{
                    
                    NavigationLink(destination: SubmissionForm()) {
                        Text("Add")
                    }
                    .accentColor(.blue)
                    
                    List(activityList.tasks, id: \.id){
                        task in
                        Text(task.activity)
                        Text(task.date, format: .dateTime)
                    }
                }.onAppear{activityList.getAllTask()}
                        
                
            }
        }
        .accentColor(.black)
    }
}

struct planit_Previews: PreviewProvider {
    static var previews: some View {
        TabPlanIt()
    }
}
