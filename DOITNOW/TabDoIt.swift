//
//  TabDoIt.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/19/22.
//

import SwiftUI

struct TabDoIt: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            Background()
            
            Title(title: "DO IT NOW!")
        }
    }
}

struct TabDoIt_Previews: PreviewProvider {
    static var previews: some View {
        TabDoIt()
    }
}
