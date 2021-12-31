//
//  weather_remote_repository.swift
//  weather app
//
//  Created by Akashaka on 30/12/21.
//api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

import Foundation

class WeatherRemoteDataSource{
     let apiKey: String=Key.apiKey
    let netManager: NetworkManager = NetworkManager()
    func getCurrentWeather(latitude: Double,longitude: Double,completion: @escaping(Swift.Result<Weather, Error>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)") else { fatalError("Invalid URL") }
//        netManager.request<Weather>(fromUrl:url) { (result: Result<[Weather], Error>) in
//            switch result{
//            case .success:
//                completion(result)
//            case .failure:
//                completion(WeatherError(errorMessage: result))
//
//            }
//        }
        netManager.request(fromUrl: url) { (result: Result<Weather, Error> )in
            completion(result)
        }
    }
    
}
