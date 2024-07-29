//
//  WeatherData.swift
//  Clima_Weather_IOS
//
//  Created by Harsh Kumar on 29/07/24.
//
////****THIS IS THE DATA MODEL OF WEATHER JSON RECIEVED FROM OPEN WEATHER WEBSITE'S API
import Foundation
struct WeatherData : Decodable { //This is how you mention the data type of the weather data
    
    
    let name : String
    let main : Main
    let weather : [Weather] ///!! Make sure the parameter names like name and weather are exactly same as the ones in the Json File
    ///!!!!!Make this Weather a Array type [] enclose it with close brackets else you will get type mismatch errors 
}
struct Main : Decodable {
    let temp : Double  ///? Temp is the sub data type of the main where some properties like temp , pressure etc are stored
}

struct Weather : Decodable{
    let description : String
}
