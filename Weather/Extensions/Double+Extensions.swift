//
//  Double+Extensions.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 25.07.2021.
//

import Foundation

extension Double {
    // Конвертирование градусов в фаренгейты
    func toFahrenheit() -> String {
        return String(format: "%.0F °F", (self * 1.8 + 32).rounded())
    }
    
    // Конвертирование градусов в цельсии
    func toCelsius() -> String {
        return String(format: "%.0F °C", self)
    }
    
    // Функция для определения состояния погоды по ощущениям
    func toFeelsLikeEmodji() -> String {
        var feelsLikeStyle: FeelsLikeStyle = .normal
        if self <= 10 {
            feelsLikeStyle = .cold
        } else if self >= 11 && self <= 25 {
            feelsLikeStyle = .normal
        } else if self >= 26 {
            feelsLikeStyle = .hot
        }
        return feelsLikeStyle.rawValue
    }
}

