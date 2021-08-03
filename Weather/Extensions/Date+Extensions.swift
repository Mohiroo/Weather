//
//  Date+Extensions.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 13.07.2021.
//

import Foundation

extension Date {
    // Получение дня недели для дневной погоды
    func getWeekday() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: self).capitalized
    }
    
    // получение времени для часовой погоды
    func getHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: self).capitalized
    }
}
