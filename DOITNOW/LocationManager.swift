//
//  LocationManager.swift
//  DOITNOW
//
//  Created by Madi Berman on 4/22/22.
//

import Foundation
import CoreLocation
import Combine
import MapKit

//Code partially sourced from https://stackoverflow.com/questions/57681885/how-to-get-current-location-using-swiftui-without-viewcontrollers
//Code partially sourced from https://www.youtube.com/watch?v=kWAWmWZV0n4


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    @Published var currentCity: String?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
    
//Code sourced from https://stackoverflow.com/questions/49276052/unable-to-get-city-name-by-current-latitude-and-longitude-in-swift
    func getCity(lat: Double, lon: Double){
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude:  lon)
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) -> Void in

            placemarks?.forEach { (placemark) in

                if let city = placemark.locality
                {
                    self.currentCity = city
                }
            }
        })
    }
}
