//
//  WeatherPageView.swift
//  weather app
//
//  Created by Akashaka on 31/12/21.
//

import SwiftUI

struct WeatherPageView: View {
    var weather:Weather
    var body: some View {
        ZStack(alignment:.leading) {
            VStack{
                HStack{
                    ZStack {
                        AsyncImage(url: URL(string: "https://github.com/IzumiShaka-desu/gif_host/raw/main/weather-icon-png-11067.png")!
                        )
                            .frame(width: 30, height: 30, alignment: .center)
                    }
    Text("are")
                    
                }
                HStack{}
                HStack{}
            }.background(Color(hue: 0.56, saturation: 0.886, brightness: 0.933))
        }
    }
}

struct WeatherPageView_Previews: PreviewProvider {
    static var previews: some View {
        let dummies:Weather=Weather(coord: Coord(lon: 10, lat: 10), weather: [WeatherElement(id: 1, main: "Clouds", weatherDescription: "scattered clouds", icon: "03d")], base: "base", main: Main(temp: 26, feelsLike: 25, tempMin: 10.2, tempMax: 29, pressure: 1, humidity: 1), visibility: 10000, wind: Wind(speed: 7.36, deg: 248), clouds: Clouds(all: 43), dt: 1, sys: Sys(type: 1, id: 1, message: 1, country: "ID", sunrise: 1640904289, sunset: 1640949159), timezone: 25200, id: 1, name: "Curug", cod: 200)
        WeatherPageView(weather: dummies)
    }
}
