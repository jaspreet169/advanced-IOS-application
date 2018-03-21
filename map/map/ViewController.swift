//
//  ViewController.swift
//  map
//
//  Created by MacStudent on 2018-03-21.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var search: UITextField!
    
    @IBOutlet weak var map: MKMapView!
    
    @IBAction func btn(_ sender: UIButton) {
        //what you want to search
        let key = "shopping mall"
        
        // build a search  request
        let search = MKLocalSearchRequest()
        search.naturalLanguageQuery = key
        
        
       let cord = CLLocationCoordinate2DMake(37.413293, -122.0743)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let regionA = MKCoordinateRegion(center: cord, span: span)
        
        search.region = regionA
    }
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            //print(place)
            
        //    for x in place{
                //print(x.phoneNumber)
                //print(x.name)
                
                
            //    let name = x.name
            //    let phone = x.phoneNumber
            //    let lat = x.placemark.coordinate.latitude
           //     let long = x.placemark.coordinate.longitude
           //     print(name)
           //     print("cordintes: \(lat) ,\(long)")
                
                //print(x.placemark.coordinate.latitude)
             //   }
     //   }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


