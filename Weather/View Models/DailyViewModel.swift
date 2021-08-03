//
//  DailyViewModel.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 16.07.2021.
//

import Foundation

// Модель данных погоды на 7 дней
class DailyWeatherViewModel: ObservableObject {
    // Локальная переменная, которая хранит значения погоды на 7 дней
    @Published var dailyWeather: [DailyWeatherGet]?
    // Локальная переменная, отвечающая за вид градусов
    @Published var temperatureStyle: TemperatureStyle = .celsius
    var day: Int = 0
    
    var weekday: String {
        guard let weekday = dailyWeather?[day].day else {return "--"}
        return weekday.getWeekday()
    }

    var weatherStatus: String {
        guard let weatherStatus = dailyWeather?[day].weatherStatus else {return "--"}
        return weatherStatus.weatherStyle()
    }

    var temperatureDay: String {
        guard let tempD = dailyWeather?[day].temperatureDay else {return "--"}
        switch self.temperatureStyle {
            case .fahrenheit:
                return tempD.toFahrenheit()
            case .celsius:
                return tempD.toCelsius()
        }
    }

    var temperatureNight: String {
        guard let tempN = dailyWeather?[day].temperatureNight else {return "--"}
        switch self.temperatureStyle {
            case .fahrenheit:
                return tempN.toFahrenheit()
            case .celsius:
                return tempN.toCelsius()
        }
    }
    
    // Функция обновления погоды
    func refreshData(service: NetworkService) {
        service.getWeather(completion: { data in
            DispatchQueue.main.async {
                self.dailyWeather = data?.dailyWeather
            }
        })
    }
}
