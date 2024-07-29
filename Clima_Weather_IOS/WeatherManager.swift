//
//  WeatherManager.swift
//  Clima_Weather_IOS
//
//  Created by Harsh Kumar on 25/07/24.
//****THIS FILE WILL BE RESPONSIBLE TO  FETCH DATA FROM OPEN WEATHER AND PROCESS IT

import Foundation
class WeatherManager { ///The city name is passed from the view controller
    
    let weatherUrl="https://api.openweathermap.org/data/2.5/weather?&appid=e0f1170c7a75cac9683b5e257967f5c6&units=metric"
    
    func fetchweather(cityname:String){
        let urlString="\(weatherUrl)&q=\(cityname)"
        performrequest(urlString: urlString)
    }
    
    
    func performrequest(urlString:String){ //Here the url will be processed and url session will execute
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task =  session.dataTask(with:url) {
                ( data, response, error) in ///*Here we are using a closure
                ///Closures  are  a type of  functions without func keyword  or it's name
                //This will be responsible for handling the final data recieved from the URL
                if error != nil{ //If No data is received then we'lll print error message
                    print(error!)
                    return
                } ///This method defined below will return the data string
                if let safedata=data{
                    self.parseJson(weatherData: safedata)
                }
            }
            task.resume() ///!!!This will start the fetch task make sure it's inside the if let url else the url data will not be fetched
        }
    }
    /////!!!!!!!MAKE SURE THIS ParseJson  FUNCTION IS NOT A PART of above Perforem request function , shouldn't be nested
    func parseJson(weatherData:Data) {
        let decoder = JSONDecoder()
        do {//////!!!VERY IMP TO CHOOSE datatype in the below line Weatherdata.self , (choose the one Weatherdata with the p logo )and in the from: Parameter  we choose this very own function's argument weatherdata mentioned in line 38 as function argument
            let decodedData = try decoder.decode(WeatherData.self, from:weatherData)
            let name=decodedData.name ////??? Here WE ARE EXTRACTING IMPORTANT WEATHER NAME AND OTHER PROPERTIES FROM THE DECODER AND STORING THEM TO PASS THEM BELOW IN THE WEATHER MODEL FILE
            ///we are doing all this passing values and all to rganise our code efficently among different files
            let id=decodedData.weather[0].id
            let temp=decodedData.main.temp
            let weather=WeatherModel(conditionId:id, cityName:name, temperature:temp) ///Passing above values in the model
            print(weather.temperatureString); ///Now after passing the data into the Weather model we can easily fetc the data like this bu just typing weather.(property that we need to fetch )
            print(weather.conditionName)
            
        } catch {
            print(error);
        }
        
    }
    
 
    
    
    
}
