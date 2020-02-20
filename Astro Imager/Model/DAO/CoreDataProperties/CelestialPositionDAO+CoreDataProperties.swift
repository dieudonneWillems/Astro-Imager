//
//  CelestialPositionDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension CelestialPositionDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CelestialPositionDAO> {
        return NSFetchRequest<CelestialPositionDAO>(entityName: "CelestialPositionDAO")
    }

    @NSManaged public var centerDeclination: Double
    @NSManaged public var centerRightAscension: Double
    @NSManaged public var positionAngle: Double
    @NSManaged public var resolution: Double
    @NSManaged public var set: ImageSetDAO?

}
