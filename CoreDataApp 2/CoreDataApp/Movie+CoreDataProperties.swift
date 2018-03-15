//
//  Movie+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by MacStudent on 2018-03-14./Users/macstudent/Desktop/CoreDataApp/CoreDataApp/Movie+CoreDataProperties.swift
//  Copyright © 2018 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var name: String?
    @NSManaged public var year: String?
    @NSManaged public var seen: Bool
    @NSManaged public var categories: MovieType?
    

}
