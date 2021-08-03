//
//  URL+Extensions.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 05.07.2021.
//

import Foundation

// Предупреждение ошибки запроса
extension URL {
    static func weatherFor(_ lat: Double, _ lon: Double) -> URL? {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&units=metric&exclude=minutely,alerts&appid=a2a547e518f84226526b6892267b9e1f") else {
            return nil
        }
        return url
    }
}


