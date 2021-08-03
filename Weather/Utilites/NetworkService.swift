//
//  SearchModel.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 04.07.2021.
//

import Foundation

// Утилита отправления запросов на сервер и обработки ответов
class NetworkService: ObservableObject {
    // Переменная? которая содержит полученные данные
    @Published var getData: WeatherJSON?
    
    func getWeather(completion: @escaping (WeatherJSON?) -> Void) {
        completion(getData)
    }
    
    // Скачивание погоды
    func downloadWeather(_ lat: Double, _ lon: Double) {
        guard let weatherURL = URL.weatherFor(lat, lon) else {return}
        
        // Создание URL-запроса
        URLSession.shared.dataTask(with: weatherURL) { (data, _, error) in
            guard let data = data, error == nil else {return}
            
            let weather = try? JSONDecoder().decode(WeatherJSON.self, from: data)
            
            guard let weather = weather else {return}
            DispatchQueue.main.async {
                self.getData = weather
            }
        }.resume()
    }
    
}
