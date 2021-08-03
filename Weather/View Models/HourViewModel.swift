//
//  HourViewModel.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 26.07.2021.
//

import Foundation

// Модель данных погоды на 24 часа
class HourlyWeatherViewModel: ObservableObject {
    // Локальная переменная, которая хранит значения погоды на 24 часа
    @Published var horlyWeather: [HourlyWeatherGet]?
    // Локальная переменная, отвечающая за вид градусов
    @Published var temperatureStyle: TemperatureStyle = .celsius
    var hour: Int = 0

    var time: String {
        guard let time = horlyWeather?[hour].time else {return "--"}
        return time.getHour()
    }
    
    var temperature: String {
        guard let temperature = horlyWeather?[hour].temperature else {return "--"}
        switch self.temperatureStyle {
            case .fahrenheit:
                return temperature.toFahrenheit()
            case .celsius:
                return temperature.toCelsius()
        }
    }
    
    // Функция обновления погоды
    func refreshData(service: NetworkService) {
        service.getWeather(completion: { data in
            DispatchQueue.main.async {
                self.horlyWeather = data?.hourlyWeather
            }
        })
    }
}
