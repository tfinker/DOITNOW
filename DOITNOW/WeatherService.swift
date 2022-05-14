//
//  WeatherService.swift
//  DOITNOW
//
//  Created by Madi Berman on 4/22/22.
//

import SwiftUI
import Foundation

class WeatherService: ObservableObject {
    
    @ObservedObject var taskManager: TaskManager
    @Published var errorMessage: String?
    @Published var forecast: WeatherData?
    var locationManager = LocationManager()
    
    init(taskManager: TaskManager){
        self.taskManager = taskManager;
    }
    
    func getWeather(lat: Double, lon: Double){
        let weatherURL = "https://api.openweathermap.org/data/2.5/forecast?&appid=1f2a622de40bc9dd2a29420d2bf1f881&units=metric"
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        print(urlString)
        print("IT RAN")
         
        guard let url = URL(string: urlString)
        else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                        self.forecast = decodedData
                        print("WeatherData...\(String(describing: self.forecast))")
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func getConditionName(weatherID: Int) -> String{
        switch weatherID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
    }
    
//    func getForecast(){
//        let lat = locationManager.lastLocation?.coordinate.latitude
//        let lon = locationManager.lastLocation?.coordinate.longitude
//        if lat != nil{
//            self.getWeather(lat: lat!, lon: lon!)
//        }
//    }
//    
//    func getMorningTime(){
//        let lat = locationManager.lastLocation?.coordinate.latitude
//        let lon = locationManager.lastLocation?.coordinate.longitude
//        if lat != nil{
//            self.getWeather(lat: lat!, lon: lon!)
//        }
//        taskManager.getAllTask()
//        taskManager.getNextActivity()
//        for i in self.forecast!.list{
//            if i.dt.formatted(date: .abbreviated, time: .omitted) == taskManager.nextDate!.formatted(date: .abbreviated, time: .omitted){
//                print("found")
//            }else{
//                print("kys")
//            }
//        }
//    }

}
