//
//  ViewController.swift


import UIKit
import CoreLocation
class WeatherViewController: UIViewController {
    

    @IBOutlet var Searchpressed: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
  
    @IBOutlet var SearchButton: UIButton!
    var weathermanager=WeatherManager() //!!!Make sure to assign a file's class in a variable before passing value to it or using value or pwrdorming any operations in it .
    let locationManager = CLLocationManager() ///This CLLOCATION service is the protocol responsible for getting the user's Location
     
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate=self; //!!Set the Kocation Manager .delegate first before requesting the location orn else error will Occur `
        locationManager.requestWhenInUseAuthorization() //This will Request use for location access
        locationManager.requestLocation() //This will Get User's Location
   
      
        Searchpressed.delegate=self; ///Initialising the delegates
        weathermanager.delegate=self;///Initialising the delegates
    
 
    }
  
    @IBAction func LocationButton(_ sender: UIButton) {
        locationManager.requestLocation()
       
    }
}


////This Extension Will Be Created Outside the class ,!!!! Do not Create this Inside the    Class

extension WeatherViewController:UITextFieldDelegate{ ///!!!!Ones You have Succesfully Adopted this Delegate here , You Can Delete the One On the Top  that you declared while creating the WeatherViewController Class or else you will get Redundant cnformence of Protocol Error
        @IBAction func SearchButton(_ sender: UIButton) {
        Searchpressed.endEditing(true)
        
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
            }/////Please do not write weathermanager as WeatherManager else your code will get fucked and you'll waste your entire night solving a simple bug cause just by using a uppercase letter instead of a loiwercase one and you'll get fucked and fucked and fucked all along
            
            Searchpressed.text="" //Will empty the text field ones weather is submitted
        }
    
}

extension  WeatherViewController:CLLocationManagerDelegate{
    
 
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
     if  let location = locations.last{ //WE get the last location because that is the most precise location
            let lat = location.coordinate.latitude //This is hoew we get the current Latitude and Longitude of the User's Location
            /// Note that the .coordinate is an Optional Value
            let lon = location.coordinate.longitude
            weathermanager.fetchweather(latitude: lat ,longitude: lon); //We need to impliment this function again in the weather manager with arguments lat and lon and make a new method with same name as earlier ad we still refer to it as fetchweather to get the weather from the user  , MAKE SURE TO NOT WRITE weathermanager as weatherManager else code will really not work and you'll burn your enire night fixing and solving a simple Bug 
        }
        print("Got Location Data ")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) { ///This function that notifies user that location fetching is failed  is equally as important as fetching the location
        print(error)
    }
}
extension WeatherViewController : WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            print(weather.temperatureString)
                       print(weather.conditionName)
                       print(weather.cityName)
            self.temperatureLabel.text=weather.temperatureString
            self.conditionImageView.image=UIImage(systemName: weather.conditionName)
            self.cityLabel.text=weather.cityName
        }
            }
    func didfailwitherror(error: any Error) {
        print(error)
    }
    
}
