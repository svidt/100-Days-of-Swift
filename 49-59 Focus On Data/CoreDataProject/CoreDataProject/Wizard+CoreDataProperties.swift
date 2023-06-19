//
//  Wizard+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Kristian Emil Hansen Svidt on 19/06/2023.
//
//

import Foundation
import CoreData


extension Wizard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wizard> {
        return NSFetchRequest<Wizard>(entityName: "Wizard")
    }

    @NSManaged public var name: String?

}

extension Wizard : Identifiable {

}
