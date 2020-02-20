//
//  DoublePropertyDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension DoublePropertyDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DoublePropertyDAO> {
        return NSFetchRequest<DoublePropertyDAO>(entityName: "DoublePropertyDAO")
    }

    @NSManaged public var doubleValue: Double

}
