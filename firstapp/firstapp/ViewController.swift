//
//  ViewController.swift
//  firstapp
//
//  Created by MacStudent on 2018-03-13.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = UserDefaults.standard
        print(defaults)
        
        //add things to user defaults
        defaults.set(true, forKey: "wifiOn")
        defaults.set(0.56, forKey: "volume")
        defaults.set("jaspreet", forKey:"name")
        
        //get things out of user defaults
        let x = defaults.double(forKey: "volume")
        let y = defaults.string(forKey: "name")
        let z = defaults.bool(forKey: "wifiOn")
        print(x)
        print(y)
        print(z)
        
        // create an array
        let arr = ["apple","banana","donut"]
        defaults.set(arr,forKey:"fruit")
        
        let a = defaults.array(forKey: "fruit") as![String]
        print(a)
        
        //dictinories
        let  stu = ["name":"jaspreet", "id":"c023455" ,"program":"MADT"]
        defaults.set(stu, forKey: "studentInfo")
        
        let b = defaults.dictionary(forKey: "studentInfo") as! Dictionary<String,String>
        print(b)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

