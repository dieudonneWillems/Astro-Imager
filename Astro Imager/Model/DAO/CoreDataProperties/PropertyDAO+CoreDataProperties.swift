//
//  PropertyDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension PropertyDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PropertyDAO> {
        return NSFetchRequest<PropertyDAO>(entityName: "PropertyDAO")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: AstroImageDAO?
    @NSManaged public var processor: ProcessorDAO?

}
