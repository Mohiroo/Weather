//
//  HourWeatherViewModel.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 26.07.2021.
//

import SwiftUI

// Отображение почасовой погоды
struct HourWeatherViewModelStack: View {
    var hourlyWeatherVM: HourlyWeatherViewModel
    
    let time: String
    let temperature: String
    let timeForCircle: CGFloat
    
    init(hourlyWeatherVM: HourlyWeatherViewModel, hour: Int) {
        self.hourlyWeatherVM = hourlyWeatherVM
        self.hourlyWeatherVM.hour = hour
        
        self.time = hourlyWeatherVM.time
        self.temperature = hourlyWeatherVM.temperature
        self.timeForCircle = CGFloat((24.0 - Double(hour)) / 24)
    }
    
    var body: some View {
        VStack(spacing: 2) {
            Text(time)
                .font(.footnote)
            Text(temperature)
                .font(.subheadline)
                .bold()
        }
        .padding(.all, 10)
        .background(
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .opacity(0.2)
                    .foregroundColor(.blue)
                Circle()
                    .trim(from: 0.0, to: timeForCircle)
                    .stroke(style: StrokeStyle(lineWidth: 2.0, lineCap: .round))
                    .foregroundColor(.blue)
            }
        )
        .padding(.vertical, 2)
    }
}

struct HourWeatherViewModelStack_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HourWeatherViewModelStack(hourlyWeatherVM: HourlyWeatherViewModel(), hour: 1)
        }
    }
}
