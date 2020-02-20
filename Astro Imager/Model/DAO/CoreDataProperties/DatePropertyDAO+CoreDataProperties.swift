//
//  DatePropertyDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension DatePropertyDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DatePropertyDAO> {
        return NSFetchRequest<DatePropertyDAO>(entityName: "DatePropertyDAO")
    }

    @NSManaged public var dateValue: Date?

}
