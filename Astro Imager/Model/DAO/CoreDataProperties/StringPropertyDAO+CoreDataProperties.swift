//
//  StringPropertyDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension StringPropertyDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StringPropertyDAO> {
        return NSFetchRequest<StringPropertyDAO>(entityName: "StringPropertyDAO")
    }

    @NSManaged public var stringValue: String?

}
