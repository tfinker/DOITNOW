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
    let list: [List]
}

struct List: Decodable{
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
