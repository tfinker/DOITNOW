//
//  ZoomView.swift
//  DOITNOW
//
//  Created by Madi Berman on 4/25/22.
//

import SwiftUI
import Foundation

struct ZoomView: View{
    
    @Binding var sportImage: String?
    @Binding var temp: Double?
    @Binding var conditionImage: Image?
    
    var body: some View {
        
        ZStack{
            Background()
        
            VStack{
                HStack{
                    Text("\(self.temp! ,specifier: "%.0f")°C")
                        .font(.title)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                    conditionImage
                        .font(.title)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                    
                }
                if let image = sportImage{
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}
