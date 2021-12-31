//
//  ContentView.swift
//  weather app
//
//  Created by Akashaka on 30/12/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager=LocationManager()
    let weatherDs=WeatherRemoteDataSource()
    @State var  weatherState:Weather?
    @State var errorState: Error?
    
    func getWeather( longitude: Double,latitude: Double)->Weather? {
        weatherDs.getCurrentWeather(latitude: latitude, longitude: longitude, completion: { (result: Result<Weather, Error> )in
           switch result{
            case .success(let result):
               weatherState=result
            case .failure(let failure):
               errorState = failure
                                    }
        })
            return weatherState

    }
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if (weatherState != nil){
                    WeatherPageView(weather: weatherState!)
                }else{
                    if let weather =  getWeather(longitude: location.longitude, latitude: location.latitude){
                        WeatherPageView(weather: weather)
                    }else{
                        Text(errorState?.localizedDescription ?? "")
                    }

                }
                                
            }else{
                if locationManager.isLoading{
                    ProgressView().frame(maxWidth:.infinity, maxHeight:.infinity)
                }else{
                    LocationView().environmentObject(locationManager)
                }
            }
            
        }.background(Color(hue: 0.56, saturation: 0.886, brightness: 0.933))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
