//
//  location_manager.swift
//  weather app
//
//  Created by Akashaka on 30/12/21.
//

import Foundation
import CoreLocation
class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var location:CLLocationCoordinate2D?
    @Published  var isLoading = false
    
    override init(){
        super.init()
        manager.delegate = self
    }
    func requestLocation(){
        isLoading=true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        

    #if targetEnvironment(simulator)
        location=CLLocationCoordinate2D(latitude: -6, longitude: 106)
    #else
        location = locations.first?.coordinate
    #endif
//        if TARGET_IPHONE_SIMULATOR ==Target {
//
//        }
//                location=CLLocationCoordinate2D(latitude: 6.3271, longitude: 106.1169)
        isLoading=false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        debugPrint("Error getting Location",error)
        isLoading=false
    }
}
