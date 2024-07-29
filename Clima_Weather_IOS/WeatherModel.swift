//
//  WeatherModel.swift
//  Clima_Weather_IOS
//
//  Created by Harsh Kumar on 30/07/24.
//

import Foundation


struct WeatherModel {
    let conditionId:Int
    let cityName:String
    let temperature:Double
    var temperatureString:String{
        return String(format:"%.01f",temperature) ///This is also a computed property which will compute (format the given temperature upt 1 decimal places only )
    }
    var conditionName:String{ ///This is an example of a computed property which will compute property based on given data , We are passing condition id here so that It can calculate the correct id and then process the data as per the [processed ID
        switch conditionId{
        case 200...232:
            return "cloud.bolt" ///Here we are printing the Icon to be Displayed as per the current weather of the city
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
  
}
