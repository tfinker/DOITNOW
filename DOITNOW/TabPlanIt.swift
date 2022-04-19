//
//  planit.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/19/22.
//

import SwiftUI

struct TabPlanIt: View {
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .top) {
                Background()
                
                NavigationLink(destination: SubmissionForm()) {
                    Text("Add")
                }
                .accentColor(.blue)
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
