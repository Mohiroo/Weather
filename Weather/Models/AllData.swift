//
//  AllData.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 24.07.2021.
//

import Foundation

// Полная модель необходимых данных JSON
struct WeatherJSON: Decodable {
    // Актуальная погода из JSON
    let current: CurrentWeather
    // Дневная погода из JSON
    let daily: [DailyWeather]
    // Часовая погода из JSON
    let hourly: [HourlyWeather]
    
    // Модель погоды, собранная из значений JSON, но в удобном формате
    let currentWeather: CurrentWeatherGet
    var dailyWeather: [DailyWeatherGet]
    var hourlyWeather: [HourlyWeatherGet]
    
    private enum CodingKeys: String, CodingKey {
        case current
        case daily
        case hourly
    }
    
    // Раскрытие каждого значения по ключу и инициализация собственных контейнеров
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        current = try container.decode(CurrentWeather.self, forKey: .current)
        daily = try container.decode([DailyWeather].self, forKey: .daily)
        hourly = try container.decode([HourlyWeather].self, forKey: .hourly)
        
        currentWeather = CurrentWeatherGet(temperature: current.temp, feelsLike: current.feels_like, pressure: current.pressure, humidity: current.humidity, wind: current.wind_speed, weatherStatus: current.weather[0].description)
        
        dailyWeather = []
        for i in 0...7 {
            dailyWeather.append(DailyWeatherGet(day: daily[i].dt, weatherStatus: daily[i].weather[0].description, temperatureDay: daily[i].temp.day, temperatureNight: daily[i].temp.night))
        }
        
        hourlyWeather = []
        for i in 0...24 {
            hourlyWeather.append(HourlyWeatherGet(time: hourly[i].dt, temperature: hourly[i].temp))
        }
        
    }
}

struct CurrentWeatherGet: Decodable {
    let temperature: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let wind: Double
    let weatherStatus: String
}

struct DailyWeatherGet: Decodable {
    let day: Date
    let weatherStatus: String
    let temperatureDay: Double
    let temperatureNight: Double
}

struct HourlyWeatherGet: Decodable {
    let time: Date
    let temperature: Double
}
