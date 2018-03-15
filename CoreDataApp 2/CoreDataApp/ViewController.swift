//
//  ViewController.swift
//  CoreDataApp
//
//  Created by MacStudent on 2018-03-14.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {

    // create a data source
    //var movies = ["Black Panther", "Avengers: Infinity War", "Shape of the Water", "Padmaavat", "Thugs of Hindostan", "Baaghi 2", "DFJKDFJ"]
    
    // create context (THIS IS YOUR DATABASE VARIABLE)
    let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // this is my datasource (array of Movie objects)
    var movies = [Movie]()
    
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
        
        // logic - save your stuf to the database
        do {
           try myContext.save()
        }
        catch {
            print("error saving data: \(error)")
        }
    }
    
    func loadData() {
        print("loading data")
        let request : NSFetchRequest<Movie> = Movie.fetchRequest()
        
        let query = NSPredicate(format: "name CONTAINS %@", "Ready player")
        
        do {
            movies = try myContext.fetch(request)
        }
        catch {
            print("error saving data: \(error)")
        }
    }

    @IBAction func addMovie(_ sender: Any) {
        // create the alert box
        let alertBox = UIAlertController(title: "Movie Name", message: "Enter the movie title", preferredStyle: .alert)
        
        alertBox.addTextField()
        
        // make a button for the alertbox
        let okButton = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            
            let item = alertBox.textFields?[0].text
            
            print(item)
            
            // logic: add your movie to the database and array
            
            // create a new movie object
            let movie = Movie(context: self.myContext)
            
            // set the movie object's properties
            movie.name = item
            movie.seen = false
            
            // add to the array
            self.movies.append(movie)
            
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
        return movies.count
    }
    
    // tell ios what each cell looks like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dont' forget to change "myCell" to whatever you called it in the storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // put some text in each row
        cell.textLabel?.text = movies[indexPath.row].name
        cell.detailTextLabel?.text = String(movies[indexPath.row].seen)
        return cell
    }
    
    // what should happen when you click on stuff
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // show the row number
        print(indexPath.row)
        
        // show what's actually in the row
        print(movies[indexPath.row])
        
        // when you click on the row, change whether
        // you have seen the movie!
        let m = movies[indexPath.row]
        if (m.seen == true) {
            m.seen = false
        }
        else {
            m.seen = true
        }
        saveData()
        tableView.reloadData()
    }
    
    // delete a row of the table
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("going to delete!")
            
            // LOGIC: delete it from DB and ARRAY
            
            // delete it from DB
            //  - do the delete
            myContext.delete(movies[indexPath.row])
            //  - save YOUR CHANGES!!!!!!!!!!!
            saveData()
            
            // delete it from the array
            movies.remove(at: indexPath.row)
            
            // UI: delete it from the tableView
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
    }

}

