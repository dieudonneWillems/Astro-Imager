//
//  BooleanPropertyDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension BooleanPropertyDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BooleanPropertyDAO> {
        return NSFetchRequest<BooleanPropertyDAO>(entityName: "BooleanPropertyDAO")
    }

    @NSManaged public var booleanValue: Bool

}
