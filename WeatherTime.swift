//
//  WeatherTime.swift
//  DOITNOW
//
//  Created by Madi Berman on 5/1/22.
//

import Foundation

//var locationManager = LocationManager()
//var weatherService = WeatherService()
//var taskManager = TaskManager()
//
//class WeatherTime: ObservableObject{
//    @Published var lat = locationManager.lastLocation?.coordinate.latitude
//    @Published var lon = locationManager.lastLocation?.coordinate.longitude
//    @Published var city: String?
//    var list: [ListJ]?
//    
//    func getTime(){
//        lat = locationManager.lastLocation?.coordinate.latitude
//        lon = locationManager.lastLocation?.coordinate.longitude
//        if lat != nil{
//            weatherService.getWeather(lat: lat!, lon: lon!)
//            taskManager.getAllTask()
//            taskManager.getNextActivity()
//
//            for i in weatherService.forecast!.list{
//                if i.dt.formatted(date: .abbreviated, time: .omitted) == taskManager.nextDate!.formatted(date: .abbreviated, time: .omitted){
//                    print("found")
//                }else{
//                    print("kys")
//                }
//            }
//        }
//    
//    }
//
//    
//}
