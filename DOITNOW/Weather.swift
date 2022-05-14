//
//  Weather.swift
//  DOITNOW
//
//  Created by Madi Berman on 4/22/22.
//
//

import UIKit
import Foundation
import SwiftUI

struct WeatherData: Decodable{
    let list: [ListJ]
}

struct ListJ: Decodable{
    let dt_txt: String
    let dt: Date
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let id: Int
    let main: String
    let icon: String
}
