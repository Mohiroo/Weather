//
//  Background.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 06.07.2021.
//

import SwiftUI

// Отображение недельной погоды
struct WeatherCell: View {
    var dayWeatherVM: DailyWeatherViewModel
    
    let date: String
    let weatherStatus: String
    let tempD: String
    let tempN: String
    
    init(dailyWeatherVM: DailyWeatherViewModel, day: Int) {
        self.dayWeatherVM = dailyWeatherVM
        self.dayWeatherVM.day = day
        
        self.date = dayWeatherVM.weekday
        self.weatherStatus = dayWeatherVM.weatherStatus
        self.tempD = dayWeatherVM.temperatureDay
        self.tempN = dayWeatherVM.temperatureNight
    }
    
    var body: some View {
        HStack {
            DayText(text: date)
            Spacer()
            WeatherStatusText(weatherStatus: weatherStatus)
            DayTemperatureText(text: tempD)
            NightTemperatureText(text: tempN)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .strokeBorder(Color.blue, lineWidth: 2)
        )
        .background(
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .fill(Color(.white).opacity(0.5))
        )
        .padding(.horizontal, 10)
        .padding(.bottom, 5)
    }
}

struct DayText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .bold()
            .padding(.leading, 15)
    }
}

struct WeatherStatusText: View {
    var weatherStatus: String
    
    var body: some View {
        Text(weatherStatus)
            .font(Font.system(size: 30))
            .padding(.trailing, 5)
    }
}

struct DayTemperatureText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .frame(width: 60, alignment: .center)
    }
}

struct NightTemperatureText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.gray)
            
            .frame(width: 50, alignment: .center)
            .padding(.trailing, 15)
    }
}

struct WeatherTopView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WeatherCell(dailyWeatherVM: DailyWeatherViewModel(), day: 1)
//            (date: "Понедельник", weatherStatus: "☀️", tempD: "23°C", tempN: "21°C")
        }
    }
}
