//
//  Title.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/13/22.
//

import SwiftUI

struct Title: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .foregroundColor(.red)
            
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(title: "PLAN IT NOW!").previewLayout(.sizeThatFits)
    }
}
