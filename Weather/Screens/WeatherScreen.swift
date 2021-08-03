//
//  WeatherScreen.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 02.08.2021.
//

import SwiftUI

// Экран отображения погоды
struct WeatherScreen: View {
    @Binding var screen: AppMode
    @Binding var temperatureStyle: TemperatureStyle
    var currentWeatherVM: CurrentWeatherViewModel
    var dailyWeatherVM: DailyWeatherViewModel
    var hourlyWeatherVM: HourlyWeatherViewModel
    var cityHead: String
    
    var body: some View {
        VStack {
            WeatherTopView(startScreen: $screen, selection: $temperatureStyle, currentWeatherVM: currentWeatherVM, dailyWeatherVM: dailyWeatherVM, hourlyWeatherVM: hourlyWeatherVM)
            CityText(city: cityHead)
            CurrentWeatherViewBlock(currentWeather: currentWeatherVM)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<25) { index in
                        HourWeatherViewModelStack(hourlyWeatherVM: hourlyWeatherVM, hour: index)
                    }
                }
            }.padding(.horizontal, 10)
                
            ScrollView(.vertical) {
                VStack {
                    ForEach(0..<8) { index in
                        WeatherCell(dailyWeatherVM: dailyWeatherVM, day: index)
                    }
                }
            }
        }.background(
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct WeatherTopView: View {
    @Binding var startScreen: AppMode
    @Binding var selection: TemperatureStyle
    var currentWeatherVM: CurrentWeatherViewModel
    var dailyWeatherVM: DailyWeatherViewModel
    var hourlyWeatherVM: HourlyWeatherViewModel
    
    var body: some View {
        HStack (spacing: 10) {
            Button(action: {
                withAnimation {
                    startScreen = .find
                }
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(
                        Circle()
                            .foregroundColor(.blue)
                    )
            }
            .transition(.slide)
            
            Picker(selection: $selection, label: Text("Picker"), content: {
                Text("°F").tag(TemperatureStyle.fahrenheit)
                Text("°C").tag(TemperatureStyle.celsius)
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding(.leading, 170)
        }.padding()
        .onChange(of: selection) { value in
            dailyWeatherVM.temperatureStyle = value
            currentWeatherVM.temperatureStyle = value
            hourlyWeatherVM.temperatureStyle = value
        }
    }
}

struct WeatherScreen_Previews: PreviewProvider {
    static var previews: some View {
        Text("1")
    }
}
