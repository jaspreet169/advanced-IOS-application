//
//  ViewController.swift
//  WeatherApp
//
//  Created by MacStudent on 2018-03-27.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    
    // -- MARK: Outlets
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
     let session : URLSession = .shared
    
    
    // -- MARK: Actions
    @IBAction func weatherPressed(_ sender: Any) {
        
        let location = locationLabel.text!
        
        if(location.isEmpty == true){
            
            print("hello")
            locationLabel.text = "enter location"
            return
        }
        
        
        //convert location into coordinates
        
        let coder = CLGeocoder()
        
        coder.geocodeAddressString(location) { (placemark , error ) in
            
            if let er = error{
                print("got an error while geolocation")
                return
                
            }
            
            if placemark!.count > 0 {
                let cord = placemark![0].location
                print(cord!.coordinate.latitude)
                print(cord!.coordinate.longitude)
                var latitude = String(cord!.coordinate.latitude)
                var longitude = String(cord!.coordinate.longitude)
                
                self.weather(lat:latitude, long:longitude)
                
                
            }
            
        }
        
        
        
        
        
        
        
        
        
       // let url = URL(string: "https://api.darksky.net/forecast/66d05979294717b81de527a2934d6383/43.6532,-79.3832?units=ca")
       
//        let task = session.dataTask(with:url!) { (data, response, error) in
//
//            if (error != nil) {
//                print(error!.localizedDescription)
//                return
//            }
//
//            let json = try? JSONSerialization.jsonObject(with:data!, options : [])
//
//            if let dict =  json as? [String:Any] {
//
//
//                let cur = dict["currently"] as! [String:Any]
//
//                let temp = cur["temperature"] as! Double
//
//                let summary = cur["summary"] as! String
//
//                print(temp)
//                print(summary)
//
//            }
//        }
        //task.resume()
    }
    
    
    
    func weather(lat:String, long:String){
        
        let url = URL(string: "https://api.darksky.net/forecast/66d05979294717b81de527a2934d6383/43.6532,-79.3832?units=ca")
        
               let task = session.dataTask(with:url!) { (data, response, error) in
        
                    if (error != nil) {
                        print(error!.localizedDescription)
                        return
                }
        
                   let json = try? JSONSerialization.jsonObject(with:data!, options : [])
        
                   if let dict =  json as? [String:Any] {
        
        
                       let cur = dict["currently"] as! [String:Any]
        
                        let temp = cur["temperature"] as! Double
        
                        let summary = cur["summary"] as! String
        
                    print(temp)
                       print(summary)
        
                   }
            }
        task.resume()
        
        
        
    }
    
    
    
    
    // -- MARK: Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

