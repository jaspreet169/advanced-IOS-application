//
//  ViewController.swift
//  secondApp
//
//  Created by MacStudent on 2018-03-14.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    //create a data source
    var movies = ["black panther","shape of the water","baaghi 2","padmaavat","infinity war","baby day out"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // table view related functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // tell how many item in table
        
       return movies.count
    }
    
    //what to put in each row of the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        //put something in row
        cell.textLabel?.text = movies[indexPath.row]

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //show the row number
        print(indexPath.row)
        
        //show what actually in the row
       print(movies[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
        if editingStyle == .delete {
            print("deleted bye")
            
            // delete it from the array
            movies.remove(at: indexPath.row)
       
            
            // delete from Ui view
            tableView.deleteRows(at: [indexPath], with: .automatic)
        
        
        }
        
    }

    
    
    
    
}

