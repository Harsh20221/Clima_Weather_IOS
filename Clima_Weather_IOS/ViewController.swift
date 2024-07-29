//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController , UITextFieldDelegate,WeatherManagerDelegate{
    var weathermanager=WeatherManager() //!!!Make sure to assign a file's class in a variable before passing value to it or using value or pwrdorming any operations in it .
    @IBOutlet var Searchpressed: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBAction func SearchButton(_ sender: UIButton) {
        Searchpressed.endEditing(true)
        
    }
    @IBOutlet var SearchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Searchpressed.delegate=self; ///Initialising the delegates
        weathermanager.delegate=self;///Initialising the delegates
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text != "")  { ///Define empty conditiion like this rathere than texttField.text != "   " , make sure you keep track of correct spaces while using != statement 
            return true}
        else {textField.placeholder="Please Enter something!!!! "
            return false }}
        
        
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            if let city=textField.text{ ///Here we are passing the cityname to the weather manager's fetchweather
                weathermanager.fetchweather(cityname: city)///Will trigger WeatherManager to fetch data from openweather's API
            }
            
            Searchpressed.text="" //Will empty the text field ones weather is submitted
        }
    func didUpdateWeather(weather:WeatherModel){
        print(weather.temperature);
    }
        
    }
    

