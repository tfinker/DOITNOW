//
//  TabDoIt.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/19/22.
//

import SwiftUI

struct TabDoIt: View {
    
    @StateObject var locationManager = LocationManager()
    var id: Int?
    @StateObject var weatherService = WeatherService()
    
    var body: some View {
        
        if weatherService.errorMessage != nil{
            Text(weatherService.errorMessage!)
        }
        
        ZStack(alignment: .top) {
            Background()
            
            Title(title: "DO IT NOW!")
            
            if let lat = locationManager.lastLocation?.coordinate.latitude, let lon = locationManager.lastLocation?.coordinate.longitude {
                VStack{
                    Text("Weather").onAppear(perform: {self.weatherService.getWeather(lat: lat, lon: lon)})
                    if let forecastDaily = weatherService.forecast?.daily[0] {
                        VStack{
                            Text("\(forecastDaily.weather[0].main)")
//                            Text("lat: \(lat)")
//                            Text("lon: \(lon)")
                            Text("\(forecastDaily.dt)")
                            Text("\(forecastDaily.temp.day ,specifier: "%.0f")°C")
                            if let id = forecastDaily.weather[0].id{
                                Image(systemName: weatherService.getConditionName(weatherID: id))
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

struct TabDoIt_Previews: PreviewProvider {
    static var previews: some View {
        TabDoIt()
    }
}
