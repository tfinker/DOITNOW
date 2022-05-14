//
//  ZoomView.swift
//  DOITNOW
//
//  Created by Madi Berman on 4/25/22.
//

import SwiftUI
import Foundation

struct ZoomView: View{
    
    @State var image: Image? = Image("Arnold")
    @Binding var temp: Double?
    @Binding var conditionImage: Image?
    
    var body: some View {
        
        ZStack{
            //Background()
        
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
            Image("Arnold")
                .resizable()
                .aspectRatio(contentMode: .fit)

        }
        }
    }
}
