//
//  ViewController.swift
//  alert
//
//  Created by MacStudent on 2018-03-14.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var byelbl: UILabel!
    
    @IBOutlet weak var alertlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func clickme(_ sender: UIButton) {
        print("hello it work")
        
        //create alert
        let alert = UIAlertController(title: "MY alert", message: "hey how are you !!", preferredStyle: .alert)
        
        
        //add a button in alert box
        let button = UIAlertAction(title: "ok", style: .default, handler: {
            action in
            
            print("goodbye")
            
            self.byelbl.text = "kida payal"
            
        })
        let cancelbutton = UIAlertAction(title: "cancel", style: .default, handler: nil)
        // add button to the button
        alert.addAction(button)
        alert.addAction(cancelbutton)
        
        //show the alert box
        present(alert, animated: true)
        
        
    }
    
    
    
    @IBAction func msgalert(_ sender: UIButton) {
        
        //create alert
        let alert1 = UIAlertController(title: "MY alert", message: "hey how are you !!", preferredStyle: .alert)
        alert1.addTextField()
        
        //add a button in alert box
        let button1 = UIAlertAction(title: "ok", style: .default, handler: {
            action in
            
           
            
         //   self.alertlbl.text = alert1
            
        })
        let cancelbutton = UIAlertAction(title: "cancel", style: .default, handler: nil)
        // add button to the button
        alert1.addAction(button1)
       
        
        //show the alert box
        present(alert1, animated: true)
        
        
        
    }
    
    

}

