//
//  URIPropertyDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension URIPropertyDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<URIPropertyDAO> {
        return NSFetchRequest<URIPropertyDAO>(entityName: "URIPropertyDAO")
    }

    @NSManaged public var uriValue: URL?

}
