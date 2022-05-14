//
//  DoITWeatherLine.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 5/14/22.
//

import SwiftUI

struct DoITWeatherLine: View {
    
    var forecastDaily: ListJ;
    var condition: String;
    @Binding var conditionImage: Image?
    @Binding var zoomTemp: Double?
    
    var body: some View {
        HStack{

            if let temperature = forecastDaily.main.temp{
                Text("\(temperature ,specifier: "%.0f")°C")
                    .onAppear(perform: {self.zoomTemp = temperature})
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                    .padding(.bottom, 75)
            }
            
            Image(systemName: condition)
                .onAppear(perform: {self.conditionImage = Image(systemName: condition)})
                .font(.title)
                .padding(.horizontal)
                .foregroundColor(.black)
                .padding(.bottom, 75)
            
        }
    }
}

//struct DoITWeatherLine_Previews: PreviewProvider {
//    static var previews: some View {
//        DoITWeatherLine()
//    }
//}
