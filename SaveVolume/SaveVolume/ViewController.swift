//
//  ViewController.swift
//  SaveVolume
//
//  Created by robin on 2017-11-08.
//  Copyright © 2017 robin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //variables
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func slider(_ sender: UISlider) {
     //  let vol = sender.value
       // print(vol)
        
        defaults.set(sender.value, forKey:"volume")
        print(sender.value)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let x = defaults.float(forKey: "volume")
        print(x)
        
        
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

