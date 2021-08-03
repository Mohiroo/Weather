//
//  HeadWeather.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 08.07.2021.
//

import SwiftUI

// Отображение актуальной погоды
struct CurrentWeatherViewBlock: View {
    var currentWeather: CurrentWeatherViewModel
    
    let weatherStatus: String
    let temperature: String
    let feelsLike: String
    let feelsLikeEmodji: String
    let wind: String
    let pressure: String
    let humidity: String
    
    init(currentWeather: CurrentWeatherViewModel) {
        self.currentWeather = currentWeather
        
        self.weatherStatus = currentWeather.weatherStatus
        self.temperature = currentWeather.temperature
        self.feelsLike = currentWeather.feelsLike
        self.feelsLikeEmodji = currentWeather.feelsLikeEmodji
        self.wind = currentWeather.wind
        self.pressure = currentWeather.pressure
        self.humidity = currentWeather.humidity
        
    }
    
    var body: some View {
        VStack {
            HStack (alignment: .center, spacing: 50) {
                VStack (spacing: 10) {
                    HStack(spacing: 3) {
                        WeatherStatus(text: weatherStatus)
                        TemperatureText(temperature: temperature)
                    }
                    FeelsLikeText(feelsLike: feelsLike, feelsLikeEmodji: feelsLikeEmodji)
                }
                
                VStack (alignment: .leading, spacing: 10) {
                    SubWeatherWindText(image: "wind", text: wind)
                    SubWeatherPressureText(image: "barometer", text: pressure)
                    SubWeatherHumidityText(image: "drop.fill", text: humidity)
                }
            }.padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 30.0)
                .strokeBorder(Color.blue, lineWidth: 3)
        )
        .padding(.all, 10)
    }
}

struct FeelsLikeText: View {
    var feelsLike: String
    var feelsLikeEmodji: String
    
    var body: some View {
        Text("\(feelsLikeEmodji) \(feelsLike)")
            .font(.callout)
    }
}

struct TemperatureText: View {
    var temperature: String
    
    var body: some View {
        Text(temperature)
            .bold()
            .fontWeight(.bold)
            .font(.largeTitle)
    }
}

struct WeatherStatus: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(Font.system(size: 50))
    }
}

struct SubWeatherWindText: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
        }
        .font(.subheadline)
        .foregroundColor(.primary)
    }
}

struct SubWeatherPressureText: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
                .padding(.leading, 2)
        }
        .font(.subheadline)
        .foregroundColor(.primary)
    }
}

struct SubWeatherHumidityText: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
                .padding(.leading, 8)
        }
        .font(.subheadline)
        .foregroundColor(.primary)
    }
}


struct CurrentWeatherViewBlock_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherViewBlock(currentWeather: CurrentWeatherViewModel())
    }
}
