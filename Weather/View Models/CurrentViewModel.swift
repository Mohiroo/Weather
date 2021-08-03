//
//  WeatherViewModels.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 05.07.2021.
//

import Foundation

// Модель данных погоды в настоящий момент по запрашиваемой локации
class CurrentWeatherViewModel: ObservableObject {
    // Локальная переменная, которая хранит значения актуальной погоды
    @Published var currentWeather: CurrentWeatherGet?
    // Локальная переменная, отвечающая за вид градусов
    @Published var temperatureStyle: TemperatureStyle = .celsius
    var feelsLikeStyle: FeelsLikeStyle = .normal

    var weatherStatus: String {
        guard let temp = currentWeather?.weatherStatus else {return "--"}
        return temp.weatherStyle()
    }

    var feelsLike: String {
        guard let feelsLike = currentWeather?.feelsLike else {return "--"}
        switch self.temperatureStyle {
            case .fahrenheit:
                return feelsLike.toFahrenheit()
            case .celsius:
                return feelsLike.toCelsius()
        }
    }

    var feelsLikeEmodji: String {
        guard let temp = currentWeather?.feelsLike.rounded() else {return "--"}
        return temp.toFeelsLikeEmodji()
    }

    var temperature: String {
        guard let temperature = currentWeather?.temperature else {return "--"}
        switch self.temperatureStyle {
            case .fahrenheit:
                return temperature.toFahrenheit()
            case .celsius:
                return temperature.toCelsius()
        }
    }
    
    var wind: String {
        guard let wind = currentWeather?.wind else {return "--"}
        return "\(Int(wind)) м/с"
    }

    var pressure: String {
        guard let pressure = currentWeather?.pressure else {return "--"}
        return String(format: "%.0F мм рт.ст.", (Double(pressure) * 0.75).rounded())
    }

    var humidity: String {
        guard let humidity = currentWeather?.humidity else {return "--"}
        return "\(humidity)%"

    }
    
    // Функция обновления погоды
    func refreshData(service: NetworkService) {
        service.getWeather(completion: { data in
            DispatchQueue.main.async {
                self.currentWeather = data?.currentWeather
            }
        })
    }
}
