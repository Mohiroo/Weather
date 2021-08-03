//
//  HourlyWeather.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 24.07.2021.
//

import Foundation

// Модель данных, взятых из JSON для часовой погоды
struct HourlyWeather: Decodable {
    let dt: Date
    let temp: Double
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        temp = try container.decode(Double.self, forKey: .temp)
        
        let timeInterval = try container.decode(Int32.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(timeInterval))
    }
}
