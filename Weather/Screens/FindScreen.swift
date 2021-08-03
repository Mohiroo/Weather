//
//  FindScreen.swift
//  Weather
//
//  Created by Даниил Ворфоломеев on 02.08.2021.
//

import SwiftUI

// Экран поиска
struct FindScreen: View {
    @Binding var city: String
    let onEditingChanged: (Bool) -> Void
    let onCommit: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            ImageTextFind(text: "☁️")
            FindText(text: "Введите название города")
            FindView(text: $city, onEditingChanged: onEditingChanged, onCommit: onCommit)
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all))
    }
}

struct FindView: View {
    var text: Binding<String>
    var onEditingChanged: (Bool) -> Void
    var onCommit: () -> Void
        
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.gray)
                TextField("Поиск", text: text, onEditingChanged: onEditingChanged, onCommit: onCommit)
                    .font(.title3)
            }
            .padding(.vertical, 6)
            .padding(.horizontal)
            .background(Color(.systemGray4))
            .cornerRadius(15.0)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 10)
        .transition(.slide)
    }
}

struct ImageTextFind: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(Font.system(size: 140))
            .padding(.vertical, -37)
    }
}

struct FindText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
    }
}

struct FindScreen_Previews: PreviewProvider {
    @State static private var city = "Moscow"
    
    static var previews: some View {
        FindScreen(city: $city, onEditingChanged: {_ in}, onCommit: {})
    }
}
