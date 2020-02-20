//
//  ImageSetDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension ImageSetDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageSetDAO> {
        return NSFetchRequest<ImageSetDAO>(entityName: "ImageSetDAO")
    }

    @NSManaged public var name: String?
    @NSManaged public var celestialPosition: CelestialPositionDAO?
    @NSManaged public var images: NSSet?
    @NSManaged public var inputForProcessors: NSSet?
    @NSManaged public var outputForProcessor: ProcessorDAO?
    @NSManaged public var subSets: NSSet?
    @NSManaged public var superSet: ImageSetDAO?

}

// MARK: Generated accessors for images
extension ImageSetDAO {

    @objc(addImagesObject:)
    @NSManaged public func addToImages(_ value: AstroImageDAO)

    @objc(removeImagesObject:)
    @NSManaged public func removeFromImages(_ value: AstroImageDAO)

    @objc(addImages:)
    @NSManaged public func addToImages(_ values: NSSet)

    @objc(removeImages:)
    @NSManaged public func removeFromImages(_ values: NSSet)

}

// MARK: Generated accessors for inputForProcessors
extension ImageSetDAO {

    @objc(addInputForProcessorsObject:)
    @NSManaged public func addToInputForProcessors(_ value: ProcessorDAO)

    @objc(removeInputForProcessorsObject:)
    @NSManaged public func removeFromInputForProcessors(_ value: ProcessorDAO)

    @objc(addInputForProcessors:)
    @NSManaged public func addToInputForProcessors(_ values: NSSet)

    @objc(removeInputForProcessors:)
    @NSManaged public func removeFromInputForProcessors(_ values: NSSet)

}

// MARK: Generated accessors for subSets
extension ImageSetDAO {

    @objc(addSubSetsObject:)
    @NSManaged public func addToSubSets(_ value: ImageSetDAO)

    @objc(removeSubSetsObject:)
    @NSManaged public func removeFromSubSets(_ value: ImageSetDAO)

    @objc(addSubSets:)
    @NSManaged public func addToSubSets(_ values: NSSet)

    @objc(removeSubSets:)
    @NSManaged public func removeFromSubSets(_ values: NSSet)

}
