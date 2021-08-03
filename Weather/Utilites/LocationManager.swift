//
//  LocationManager.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 24.07.2021.
//

import Foundation
import MapKit

// Утилита, определяет геопозицию пользователя (нужную ему)
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let geocoder = CLGeocoder()
    private var locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    @Published var userGeoCity: String = ""
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    // Установка последней геолокации пользователя
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location
    }
    
    // Получение города из последней геолокации
    func getLastCity() {
        guard let location = self.location else {return}
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?[0], error == nil else {return}
            guard let city = placemark.subAdministrativeArea else {return}
            self.userGeoCity = city
        }
    }
    
    // Получение координат из введенного города
    func getCoordinate(adress: String) {
        geocoder.geocodeAddressString(adress) { placemarks, error in
            guard let placamark = placemarks?[0], error == nil else {return}
            self.location = placamark.location!
        }
    }
    
    //Получение ошибки
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
