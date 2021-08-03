//
//  DailyData.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 16.07.2021.
//

import Foundation

// Модель данных, взятых из JSON для дневной погоды
struct DailyWeather: Decodable {
    let dt: Date
    let temp: TempDaily
    let weather: [WeatherDaily]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case weather
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        temp = try container.decode(TempDaily.self, forKey: .temp)
        weather = try container.decode([WeatherDaily].self, forKey: .weather)
        
        let timeInterval = try container.decode(Int32.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(timeInterval))
        
    }
}

struct TempDaily: Codable {
    let day: Double
    let night: Double
}

struct WeatherDaily: Codable {
    let description: String
}
