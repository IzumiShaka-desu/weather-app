//
//  LocationView.swift
//  weather app
//
//  Created by Akashaka on 30/12/21.
//

import SwiftUI
import CoreLocationUI

struct LocationView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack{
                Text("Welcome To the Weather App").bold().font(.title)
                Text("so that we can provide weather data please share your current location")
            }.multilineTextAlignment(.center).padding()
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(30)
//                    .symbolVariant(.fill).padding(10)
//                .foregroundColor(Color(hue: 0.56, saturation: 0.886, brightness: 0.933))
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
