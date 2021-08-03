//
//  Enums.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 16.07.2021.
//

import Foundation

// Вспомогательные перечисления
enum LoadingState {
    case none
    case loading
    case success
    case failed
}

enum TemperatureStyle: CaseIterable {
    case fahrenheit
    case celsius
}

enum WeatherStyle: String, CaseIterable {
    case clearSky = "☀️"
    case fewClouds = "🌤"
    case scatteredClouds = "⛅️"
    case brokenClouds = "☁️"
    case showerRain = "🌧"
    case rain = "🌦"
    case thunderstorm = "🌩"
    case snow = "🌨"
    case mist = "🌫"
}

enum FeelsLikeStyle: String, CaseIterable {
    case cold = "🥶"
    case normal = "😃"
    case hot = "🥵"
}

enum AppMode: CaseIterable {
    case start
    case find
    case weather
}


