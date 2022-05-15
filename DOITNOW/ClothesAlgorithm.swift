//
//  ClothesAlgorithm.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 4/26/22.
//

import Foundation

import UIKit

var cycle1A = "cycle1A"
var cycle1B = "cycle1B"
var cycle1C = "cycle1C"
var cycle2A = "cycle2A"
var cycle2B = "cycle2B"
var cycle2C = "cycle2C"
var cycle3 = "cycle3"

var walk1A = "walk1A"
var walk1B = "walk1B"
var walk1C = "walk1C"
var walk2A = "walk2A"
var walk2B = "walk2B"
var walk2C = "walk2C"
var walk3 = "walk3"

var run1A = "run1A"
var run1B = "run1B"
var run1C = "run1C"
var run2A = "run2A"
var run2B = "run2B"
var run2C = "run2C"
var run3 = "run3"


//https://openweathermap.org/weather-conditions

var cloudsAndClear = [
    800, 801, 802, 803, 804
]

var drizzle = [
    300, 301, 302, 310, 311, 312, 313, 314, 321
]

var lightMediumRain = [
    500, 501, 520, 521
]

var sleet = [
    611, 612, 613
]

var fog = [
    741
]

var mistHaze = [
    701, 721
]

var snow = [
    600, 601, 602
]

var lightSnow = [
    600, 601, 615, 616, 620, 621
]

var heavySnow = [
    602, 622
]

var snowRain = [
    615, 616, 620, 621, 622
]

var thunderstorms = [
    200, 201, 202, 210, 211, 212, 221, 230, 231, 232
]

var dangerousRain = [
    502, 503, 504, 511, 522, 531
]

var dangerousAtmosphere = [
    711, 731, 751, 761, 762, 771, 781
]


var cycleNormal = cloudsAndClear + mistHaze + drizzle
var cycleWet = lightMediumRain
var cycleDanger = fog + sleet + snow + snowRain + thunderstorms + dangerousRain + dangerousAtmosphere

var runNormal = cloudsAndClear + mistHaze + drizzle + fog
var runWet = lightMediumRain
var runDanger = sleet + snow + snowRain + thunderstorms + dangerousRain + dangerousAtmosphere

var walkNormal = cloudsAndClear + mistHaze + fog
var walkWet = drizzle + lightMediumRain + sleet + lightSnow
var walkDanger = thunderstorms + dangerousRain + dangerousAtmosphere + heavySnow


var cycleOptions = [
    cycleNormal :   [cycle1A, cycle1B, cycle1C],
    cycleWet :      [cycle2A, cycle2B, cycle2C],
    cycleDanger :   [cycle3, cycle3, cycle3]
]
var walkOptions = [
    walkNormal :    [walk1A, walk1B, walk1C],
    walkWet :       [walk2A, walk2B, walk2C],
    walkDanger :    [walk3, walk3, walk3]
]
var runOptions = [
    runNormal :     [run1A, run1B, run1C],
    runWet :        [run2A, run2B, run2C],
    runDanger :     [run3, run3, run3]
]

// idea is we have different images for each possibility so that it doesn't get boring
// the zoom image will be the same name with -zoom appended
// algo with randomly select an image from the list each time it runs

var pictureNames = [
    cycle1A: ["cycle1A"],
    cycle1B: ["cycle1B"],
    cycle1C: ["cycle1C"],
    cycle2A: ["cycle2A"],
    cycle2B: ["cycle2B"],
    cycle2C: ["cycle2C"],
    cycle3: ["cycle3"],
    
    walk1A: ["walk1A"],
    walk1B: ["walk1B"],
    walk1C: ["walk1C"],
    walk2A: ["walk2A"],
    walk2B: ["walk2B"],
    walk2C: ["walk2C"],
    walk3: ["walk3"],
    
    run1A: ["run1A"],
    run1B: ["run1B"],
    run1C: ["run1C"],
    run2A: ["run2A"],
    run2B: ["run2B"],
    run2C: ["run2C"],
    run3: ["run3"],
]



func getRandomPictureForType(type: String)->String?{
    let pictures = pictureNames[type];
    var total = pictures?.count ?? 0;
    if (total > 0){
        total -= 1
        if let picture = pictures?[Int.random(in:0...total)] {
            return picture
        }
    }
    return nil
}


func getTempIndex(temp: Double)->Int? {
    if temp < 5 {
        return 0
    }
    else if 5 <= temp && temp < 15 {
        return 1
    }
    else if temp >= 15{
        return 2
    }
    else {
        //error
        return nil
    }
}


func getOptions(options: Dictionary<[Int],[String]>, code: Int )->[String]? {
    for (weatherCodes, types) in options{
        if weatherCodes.contains(code){
            return types
        }
    }
    return nil;
}

func getImageString(imageOptions: [String], temp: Double) -> String? {
    if let index = getTempIndex(temp: temp){
        let type = imageOptions[index]
        return getRandomPictureForType(type: type)
        
    }
    return nil;
}

func getPicture(sport: String, temp: Double, weather: Int) -> String? {
    
    var table: Dictionary<[Int],[String]>;
    
    switch sport{
        case "Cycle":
            table = cycleOptions
        case "Walk":
            table = walkOptions
        case "Run":
            table = runOptions
        default:
            return nil;
    }
    
    if let options = getOptions(options: table, code: weather) {
        return getImageString(imageOptions: options, temp: temp);
    }
    return nil;
}
