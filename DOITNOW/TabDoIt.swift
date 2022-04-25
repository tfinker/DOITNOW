//
//  TabDoIt.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/19/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct TabDoIt: View {
    
    @StateObject var locationManager = LocationManager()
    var id: Int?
    @StateObject var weatherService = WeatherService()
    var sport: String?
    var date: Date?
    @State var lat: Double?
    @State var lon: Double?

    
    var body: some View {
        
        if weatherService.errorMessage != nil{
            Text(weatherService.errorMessage!)
        }
        
        ZStack(alignment: .top) {
            Background()
        
            VStack{
                Title(title: "DO IT NOW!")
                if let lat = locationManager.lastLocation?.coordinate.latitude, let lon = locationManager.lastLocation?.coordinate.longitude {
                    Text("")
                        .onAppear(perform: {self.weatherService.getWeather(lat: lat, lon: lon)})
                        .onAppear(perform: {self.locationManager.getCity(lat: lat, lon: lon)})

                        
                        if let forecastDaily = weatherService.forecast?.list[0] {
                            VStack{
                                if let sport = "CYCLE"{
                                    Text("\(sport)")
                                        .font(.title.bold())
                                        .padding(.horizontal)
                                        .foregroundColor(.black)
                                }
                                Text("\(forecastDaily.dt.formatted())")
                                    .font(.title)
                                    .padding(.horizontal)
                                    .foregroundColor(.gray)
                                
                                if let city = locationManager.currentCity {
                                    Text("\(city)".uppercased())
                                        .font(.title)
                                        .padding(.horizontal)
                                        .foregroundColor(.gray)
                                }
                                
                                HStack{
                                    Text("\(forecastDaily.main.temp ,specifier: "%.0f")°C")
                                        .font(.title)
                                        .padding(.horizontal)
                                        .foregroundColor(.black)
                                    if let id = forecastDaily.weather[0].id{
                                        Image(systemName: weatherService.getConditionName(weatherID: id))
                                            .font(.title)
                                            .padding(.horizontal)
                                            .foregroundColor(.black)
                                    }
                                }
                                Image("Arnold")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 150)
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
