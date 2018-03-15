//
//  MovieTypeViewController.swift
//  CoreDataApp
//
//  Created by MacStudent on 2018-03-15.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class MovieTypeViewController: UITableViewController {

    // create context (THIS IS YOUR DATABASE VARIABLE)
    let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // this is my datasource (array of Movie objects)
    var movieTypes = [MovieType]()
    
    // create a data source
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = FileManager.default.urls(for:.documentDirectory, in:.userDomainMask)
        
        print(path)
        loadData()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Database related helper functions
    func saveData() {
        print("saving data")
        
        // logic - save your stuff to the database
        do {
            try myContext.save()
        }
        catch {
            print("error saving data: \(error)")
        }
    }
    
    func loadData() {
        print("loading data")
        let request : NSFetchRequest<MovieType> = MovieType.fetchRequest()
        
        do {
            movieTypes = try myContext.fetch(request)
        }
        catch {
            print("error saving data: \(error)")
        }
    }
    
    @IBAction func addCategory(_ sender: Any) {
        
        // create the alert box
        let alertBox = UIAlertController(title: "Movie Categories", message: "Category?", preferredStyle: .alert)
        
        alertBox.addTextField()
        
        // make a button for the alertbox
        let okButton = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            
            let item = alertBox.textFields?[0].text
            
            print(item)
            
            // logic: add your movie to the database and array
            
            // create a new movie object
            let category = MovieType(context: self.myContext)
            
            // set the movie object's properties
            category.name = item
            
            
            // add to the array
            self.movieTypes.append(category)
            
            // save the movies object
            self.saveData()
            
            // ui: refresh the table
            self.tableView.reloadData()
            
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        // add the button to the alertbox
        alertBox.addAction(okButton)
        alertBox.addAction(cancelButton)
        
        // show the alert box
        present(alertBox, animated: true)
    }
 
    
    
    // TableView related functions
    
    
    // tell ios how many rows you want in your table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTypes.count
    }
    
    // tell ios what each cell looks like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dont' forget to change "myCell" to whatever you called it in the storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTypeCell", for: indexPath)
        
        // put some text in each row
        cell.textLabel?.text = movieTypes[indexPath.row].name
        return cell
    }
    // delete a row of the table
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("going to delete!")
            
            // LOGIC: delete it from DB and ARRAY
            
            // delete it from DB
            //  - do the delete
            myContext.delete(movieTypes[indexPath.row])
            
            //  - save YOUR CHANGES!!!!!!!!!!!
            saveData()
            
            // delete it from the array
            movieTypes.remove(at: indexPath.row)
            
            // UI: delete it from the tableView
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
    }
}
