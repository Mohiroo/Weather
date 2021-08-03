//
//  String+Extensions.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 05.07.2021.
//

import Foundation

extension String {
    // Конвертирование данных пользователя для создания URL-запроса
    func escaped() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    
    // Функция для обработки состояния погоды
    func weatherStyle() -> String {
        var weatherStyleTemp: WeatherStyle = .clearSky
        if self == "clear sky" {
            weatherStyleTemp = .clearSky
        } else if self == "few clouds" {
            weatherStyleTemp = .fewClouds
        } else if self == "scattered clouds" {
            weatherStyleTemp = .scatteredClouds
        } else if self == "broken clouds" {
            weatherStyleTemp = .brokenClouds
        } else if self == "shower rain" {
            weatherStyleTemp = .showerRain
        } else if self == "rain" {
            weatherStyleTemp = .rain
        } else if self == "thunderstorm" {
            weatherStyleTemp = .thunderstorm
        } else if self == "snow" {
            weatherStyleTemp = .snow
        } else if self == "mist" {
            weatherStyleTemp = .mist
        }
        return weatherStyleTemp.rawValue
    }
}
