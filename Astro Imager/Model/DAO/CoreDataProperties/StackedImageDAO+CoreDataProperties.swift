//
//  StackedImageDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension StackedImageDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StackedImageDAO> {
        return NSFetchRequest<StackedImageDAO>(entityName: "StackedImageDAO")
    }

    @NSManaged public var stackedImages: NSSet?

}

// MARK: Generated accessors for stackedImages
extension StackedImageDAO {

    @objc(addStackedImagesObject:)
    @NSManaged public func addToStackedImages(_ value: AstroImageDAO)

    @objc(removeStackedImagesObject:)
    @NSManaged public func removeFromStackedImages(_ value: AstroImageDAO)

    @objc(addStackedImages:)
    @NSManaged public func addToStackedImages(_ values: NSSet)

    @objc(removeStackedImages:)
    @NSManaged public func removeFromStackedImages(_ values: NSSet)

}
