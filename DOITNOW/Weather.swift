//
//  Weather.swift
//  DOITNOW
//
//  Created by Madi Berman on 4/22/22.
//

import UIKit
import Foundation
import SwiftUI

struct WeatherData: Decodable{
    let daily: [Daily]
}

struct Daily: Decodable{
    let weather: [Weather]
    let temp: Temp
    let dt: Date
    let uvi: Double
    let pop: Double
}
    struct Weather: Decodable{
        let main: String
        let icon: String
        let id: Int
    }
    
    struct Temp: Decodable{
        let morn: Double
        let day: Double
        let eve: Double
    }

