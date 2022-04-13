//
//  ContentView.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        ZStack(alignment: .top) {
     
            Ellipse()
                .fill(Color.orange)
                .frame(width: 800, height: 1000)
                .position(x: 300, y: 000)
            
            

            SubmissionForm()
        
        }
            

            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
