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

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

}

