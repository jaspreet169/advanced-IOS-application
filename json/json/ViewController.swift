//
//  ViewController.swift
//  json
//
//  Created by MacStudent on 2018-03-22.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var jsonlbl: UILabel!
    
    //let make json request
    let session : URLSession = .shared
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // 1. what url you want to visit?
        let url = URL(string: "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD" )
        
        
        //2. create request and send it to the internet
        let task =  session.dataTask(with:url!) { (data, response ,error )
            
            in
            
          //4. do something with results
            
            if (error != nil){
                
                print(error!.localizedDescription)
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            print(json)
            
            //parsing data
            if let x = json as? [String:Any]
            {
                //let ask = x["ask"]
                //print(ask!)
                
                let y = x["open"] as? [String:Any]
                
                let week = y!["week"]
                
                print(week)
                
               // self.jsonlbl.text = "\(String(describing:week))"
                DispatchQueue.main.async {
                    self.jsonlbl.text = "\(String(describing:week))"
                }
                
            }
        }
        
        
        //3. wait for internet to send you a response
        task.resume()
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

