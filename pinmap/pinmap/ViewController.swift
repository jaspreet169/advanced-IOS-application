//
//  ViewController.swift
//  pinmap
//
//  Created by MacStudent on 2018-03-21.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pin: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let cord = CLLocationCoordinate2DMake(43.779, -79.3447)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: cord, span: span)
        pin.setRegion(region, animated: true)
        
        
        let point = MKPointAnnotation()
        
        point.coordinate = cord
        
        point.title = "i'm here"
        
    pin.addAnnotation(point)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

