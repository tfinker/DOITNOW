//
//  Background.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/19/22.
//

import SwiftUI

struct Background: View {
    var body: some View {
        Ellipse()
            .fill(Color(red: 1.0, green: 0.5, blue: 0.0, opacity: 0.5))
            .frame(width: 800, height: 1000)
            .position(x: 300, y: 000)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
