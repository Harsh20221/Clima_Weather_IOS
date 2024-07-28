//
//  WeatherManager.swift
//  Clima_Weather_IOS
//
//  Created by Harsh Kumar on 25/07/24.
//

import Foundation
class WeatherManager { ///The city name is passed from the view controller
    let weatherUrl="https://api.openweathermap.org/data/2.5/weather?&appid=e0f1170c7a75cac9683b5e257967f5c6&units=metric"
    
    func fetchweather(cityname:String){
        let urlString="\(weatherUrl)&q=\(cityname)"
        performrequest(urlString: urlString)
    }
    
    
    func performrequest(urlString:String){ //Here the url will be processed and url session will execute
     let url=URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task =  session.dataTask(with: url!) { data, response, error in ///*Here we are using a closure
            ///Closures  are  a type of  functions without func keyword  or it's name
            //This will be responsible for handling the final data recieved from the URL
            if error != nil{ //If No data is received then we'lll print error message
                print(error!)
                return
            } ///This method defined below will return the data string
            if let safedata=data{
                let dataString = String(data:safedata,encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
        
    }
    
    
}
