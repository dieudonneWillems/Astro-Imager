//
//  DataPropertyDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension DataPropertyDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataPropertyDAO> {
        return NSFetchRequest<DataPropertyDAO>(entityName: "DataPropertyDAO")
    }

    @NSManaged public var dataValue: Data?

}
