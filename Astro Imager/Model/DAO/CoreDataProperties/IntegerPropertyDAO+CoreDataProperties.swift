//
//  IntegerPropertyDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension IntegerPropertyDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IntegerPropertyDAO> {
        return NSFetchRequest<IntegerPropertyDAO>(entityName: "IntegerPropertyDAO")
    }

    @NSManaged public var integerValue: Int64

}
