//
//  WeatherData.swift
//  Clima_Weather_IOS
//
//  Created by Harsh Kumar on 29/07/24.
//

import Foundation
struct WeatherData : Decodable { //This is how you mention the data type of the weather data
    
    
    let name : String
    let main : Main
}
struct Main : Decodable {
    let temp : Double  ///? Temp is the sub data type of the main 
    
}
