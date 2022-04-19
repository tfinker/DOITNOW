//
//  ContentView.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: .constant(1)) {
            
            TabDoIt()
                .tabItem ({
                    Label("DO IT", systemImage: "checkmark")
                    
                })
                .tag(1)
            
            TabPlanIt()
                .tabItem {
                    Label("PLAN IT", systemImage: "plus")
                }
                .tag(2)
        }
        .accentColor(.black)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
