//
//  ContentView.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 03.07.2021.
//
//
import SwiftUI
import MapKit

struct ContentView: View {
    @State var screen: AppMode = .start
    @State var city: String = ""
    @State var cityHead: String = ""
    @State var temperatureStyle: TemperatureStyle = .celsius

    @ObservedObject var networkService = NetworkService()
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var currentWeatherVM = CurrentWeatherViewModel()
    @ObservedObject var dailyWeatherVM = DailyWeatherViewModel()
    @ObservedObject var hourlyWeatherVM = HourlyWeatherViewModel()

    var body: some View {
        let coordinate = locationManager.location != nil ? locationManager.location!.coordinate : CLLocationCoordinate2D()
        
        switch screen {
        case .start:
            StartScreen(locationManager: locationManager, screen: screen) {
                locationManager.getLastCity()
                locationManager.getCoordinate(adress: locationManager.userGeoCity)
                networkService.downloadWeather(coordinate.latitude, coordinate.longitude)
                
                if networkService.getData != nil {
                    currentWeatherVM.currentWeather = networkService.getData?.currentWeather
                    dailyWeatherVM.dailyWeather = networkService.getData?.dailyWeather
                    hourlyWeatherVM.horlyWeather = networkService.getData?.hourlyWeather
                    cityHead = locationManager.userGeoCity
                    screen = .weather
                }
            } noAction: {
                screen = .find
            }

        case .find:
            FindScreen(city: $city, onEditingChanged: {_ in}) {
                locationManager.getCoordinate(adress: city)
                networkService.downloadWeather(coordinate.latitude, coordinate.longitude)
                
                if networkService.getData != nil {
                    currentWeatherVM.currentWeather = networkService.getData?.currentWeather
                    dailyWeatherVM.dailyWeather = networkService.getData?.dailyWeather
                    hourlyWeatherVM.horlyWeather = networkService.getData?.hourlyWeather
                    cityHead = city
                    city = ""
                    screen = .weather
                }
            }
        case .weather:
            WeatherScreen(screen: $screen, temperatureStyle: $temperatureStyle, currentWeatherVM: currentWeatherVM, dailyWeatherVM: dailyWeatherVM, hourlyWeatherVM: hourlyWeatherVM, cityHead: cityHead)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
