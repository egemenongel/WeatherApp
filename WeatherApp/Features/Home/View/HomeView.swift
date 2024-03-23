//
//  ContentView.swift
//  WeatherApp
//
//  Created by Egemen Öngel on 23.02.2024.
//

import SwiftUI

struct HomeView: View {
    let weather = WeatherModel(id: 1, temperature: -10, date: Date.now.formatted(date: .abbreviated, time: .omitted), location: "Ankara")

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HeaderView(weather: weather)
                    DetailsView()
                    DayTemps()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    IconButton(iconPath: "sun.max")
                    Spacer()
                    IconButton(iconPath: "safari")
                    Spacer()
                    IconButton(iconPath: "face.smiling.fill")
                    Spacer()
                }
            }
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
        }
    }
}

struct IconButton: View {
    let iconPath: String
    var body: some View {
        Button(action: {}) {
            Image(systemName: iconPath)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
        .foregroundColor(.white)
    }
}

struct HeaderView: View {
    let weather: WeatherModel

    var body: some View {
        ZStack(alignment: .leading) {
            Image("winter")
                .resizable()
            VStack(alignment: .leading) {
                Text(weather.date)
                    .font(.title2)
                    .padding(.top, 30.0)
                    .frame(maxWidth:.infinity, alignment: .leading)
                Spacer()
                Text("\(weather.temperature) °C")
                    .font(.system(size:60, weight: .bold))
                    .fontWeight(.bold)
                    .frame(maxWidth:.infinity, alignment: .trailing)
                ForEach(0 ..< 3) { _ in
                    Spacer()
                }
                HStack{
                    Text(weather.location)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Image(systemName: "arrow.up.right")
                }
            }
            .padding(20.0)
        }
        .cornerRadius(20)
        .frame(width: UIScreen.screenWidth, height: 530)
    }
}

struct DetailsView: View {
    // swiftlint:disable line_length
    let weatherProps: [WeatherPropModel] = [WeatherPropModel(id: 1, name: "Wind", iconPath: "wind", value: "5-8 km/h"), WeatherPropModel(id: 2, name: "Pressure", iconPath: "thermometer.medium", value: "1000 MB"), WeatherPropModel(id: 3, name: "Humidity", iconPath: "drop", value: "51%")]
    let boxSize = (UIScreen.screenWidth - 20) / 3
    let gradient = LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .top,
                endPoint: .bottom
    )
    var body: some View {
        HStack {
            ForEach(weatherProps) { prop in
                ZStack{
                    // TODO: Learn how to fix padding inside of the rectangles
                    RoundedRectangle(cornerRadius: 20)
                        .fill(gradient)
                    VStack(alignment: .leading, spacing: 5){
                        Image(systemName: prop.iconPath)
                        Text(prop.name)
                        Text(prop.value)
                    }
                }
                .frame(width: boxSize, height: boxSize)

            }
        }
    }
}

struct DayTemps: View {
    // swiftlint:disable line_length
    let temps: [TemperatureModel] = [TemperatureModel(id: 1, temperature: 30, day: "Now", iconPath: "sun.max.fill"), TemperatureModel(id: 2, temperature: 20, day: "3 AM", iconPath: "sun.haze.fill"), TemperatureModel(id: 3, temperature: 10, day: "4 AM", iconPath: "cloud.fill"), TemperatureModel(id: 4, temperature: 0, day: "5 AM", iconPath: "cloud.snow.fill"), TemperatureModel(id: 5, temperature: -10, day: "6 AM", iconPath: "cloud.rain.fill")]

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray.opacity(0.2))
            HStack(alignment: .center,spacing: 4) {
                ForEach(temps) { temp in
                    VStack {
                        Text(temp.day)
                        Image(systemName: temp.iconPath)
                            .frame(width: 20.0, height: 20.0)
                        Text("\(temp.temperature) °C")
                    }
                    .frame(width: 70,height: 70)
                }
            }
            .padding(12)
        }
    }
}

#Preview {
    HomeView()
}
