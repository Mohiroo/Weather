//
//  ModelsData.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 04.07.2021.
//

import Foundation

// Модель данных, взятых из JSON для актуальной погоды
struct CurrentWeather: Decodable {
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let wind_speed: Double
    let weather: [WeatherCurrent]
}


struct WeatherCurrent: Decodable {
    let description: String
}
