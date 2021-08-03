//
//  StartScreen.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 02.08.2021.
//

import SwiftUI

// Экран приветствия
struct StartScreen: View {
    let locationManager: LocationManager
    @State var screen: AppMode
    let yesAction: () -> Void
    let noAction: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            ImageTextStart(text: "☁️")
            StartText(subText: "Ваш город", text: locationManager.userGeoCity)
            HStack(spacing: 50) {
                Spacer()
                StartButtons(text: "Да", color: .green, action: yesAction)
                StartButtons(text: "Нет", color: .red, action: noAction)
                Spacer()
            }
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue , Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
        .onAppear{
            locationManager.getLastCity()
        }
    }
}

struct StartButtons: View {
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .foregroundColor(.white)
                .font(.title2)
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .fill(color.opacity(0.6))
                )
        })
    }
}

struct StartText: View {
    var subText: String
    var text: String
    
    var body: some View {
        VStack {
            Text(subText)
                .font(.largeTitle)
            Text(text)
                .bold()
                .font(.largeTitle)
        }
    }
}

struct ImageTextStart: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(Font.system(size: 140))
            .padding(.vertical, -37)
    }
}

struct CityText: View {
    var city: String
    
    var body: some View {
        Text(city)
            .bold()
            .font(.title)
            .padding(.top, 20)
    }
}

struct StartScreen_Previews: PreviewProvider {
    @State static private var screen: AppMode = .start
    static private var yesAction = {() -> Void in}
    static private var noAction = {() -> Void in}
    
    static var previews: some View {
        StartScreen(locationManager: LocationManager(), screen: screen, yesAction: yesAction, noAction: noAction)
    }
}
