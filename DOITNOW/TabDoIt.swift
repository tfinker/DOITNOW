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
    var sport: String? = "CYCLE"
    var date: Date? = Date()
    @State var lat: Double?
    @State var lon: Double?
    @State var selected = "MORNING"
    @State var isExpanded = false
    @State var showZoom = false

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
                                if sport != nil{
                                    Text("\(sport!)")
                                        .font(.title.bold())
                                        .padding(.horizontal)
                                        .foregroundColor(.black)
                                }
                                
                                //Code sourced from: https://stackoverflow.com/questions/54084023/how-to-get-the-todays-and-tomorrows-date-in-swift-4
                                let calendar = Calendar.current
                                let today = Date()
                                let midnight = calendar.startOfDay(for: today)
                                let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!
                                if date!.formatted(date: .abbreviated, time: .omitted) == today.formatted(date: .abbreviated, time: .omitted) {
                                    Text("TODAY")
                                        .font(.title)
                                        .padding(.horizontal)
                                        .foregroundColor(.gray)
                                }
                                else if date!.formatted(date: .abbreviated, time: .omitted) == tomorrow.formatted(date: .abbreviated, time: .omitted)
                                {
                                    Text("TOMORROW")
                                        .font(.title)
                                        .padding(.horizontal)
                                        .foregroundColor(.gray)
                                }
                                else {
                                    Text("\(date!.formatted(date: .abbreviated, time: .omitted))")
                                        .font(.title)
                                        .padding(.horizontal)
                                        .foregroundColor(.gray)
                                }
                                
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
                                        .padding(.bottom, 75)
                                    if let id = forecastDaily.weather[0].id{
                                        Image(systemName: weatherService.getConditionName(weatherID: id))
                                            .font(.title)
                                            .padding(.horizontal)
                                            .foregroundColor(.black)
                                            .padding(.bottom, 75)
                                    }
                                }
                                Image("Arnold")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
            
                        }
                }
            }
            
            //Code sourced from https://www.youtube.com/watch?v=0LrP6dv8tHY
            VStack
            {
                DisclosureGroup("\(selected)"
                                , isExpanded: $isExpanded){
                    VStack (alignment: .center){
                        Text("MORNING")
                            .font(.title3)
                            .padding(.all)
                            .onTapGesture {
                                self.selected = "MORNING"
                                self.isExpanded.toggle()
                            }
                        Text("AFTERNOON")
                            .font(.title3)
                            .padding(.all)
                            .onTapGesture {
                                self.selected = "AFTERNOON"
                                self.isExpanded.toggle()
                            }
                        Text("EVENING")
                            .font(.title3)
                            .padding(.all)
                            .onTapGesture {
                                self.selected = "EVENING"
                                self.isExpanded.toggle()
                            }
                    }
                }
                                .foregroundColor(.black)
                                .accentColor(.black)
                                .padding(.all)
                                .background(Color.orange)
                                .offset(y: 180)
            }.padding(.all)
            Spacer()
            
            VStack{
                Button(action: {
                    self.showZoom = true
                }) {
                    Image(systemName: "magnifyingglass.circle.fill")
                }
                    .font(.title)
                    .offset(x: 140, y: 265)
                    .foregroundColor(.white)
            }
        }
    }
}


struct TabDoIt_Previews: PreviewProvider {
    static var previews: some View {
        TabDoIt()
    }
}


