//
//  MovieType+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by MacStudent on 2018-03-15.
//  Copyright © 2018 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData


extension MovieType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieType> {
        return NSFetchRequest<MovieType>(entityName: "MovieType")
    }

    @NSManaged public var name: String?
    @NSManaged public var movies: NSSet?

}

// MARK: Generated accessors for movies
extension MovieType {

    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: Movie)

    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: Movie)

    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)

    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)

}
