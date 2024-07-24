//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController , UITextFieldDelegate{
    
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
        Searchpressed.delegate=self;
        
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
            Searchpressed.text=""
        }
        
    }
    

