//
//  ImageTransformDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension ImageTransformDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageTransformDAO> {
        return NSFetchRequest<ImageTransformDAO>(entityName: "ImageTransformDAO")
    }

    @NSManaged public var rotation: Double
    @NSManaged public var translationInX: Double
    @NSManaged public var translationInY: Double
    @NSManaged public var image: AstroImageDAO?

}
