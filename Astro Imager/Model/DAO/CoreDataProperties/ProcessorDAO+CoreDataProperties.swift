//
//  ProcessorDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension ProcessorDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProcessorDAO> {
        return NSFetchRequest<ProcessorDAO>(entityName: "ProcessorDAO")
    }

    @NSManaged public var plugin: String?
    @NSManaged public var input: ProcessorDAO?
    @NSManaged public var inputImageSet: ImageSetDAO?
    @NSManaged public var output: NSSet?
    @NSManaged public var outputImageSet: ImageSetDAO?
    @NSManaged public var pipeline: PipelineDAO?
    @NSManaged public var properties: NSSet?

}

// MARK: Generated accessors for output
extension ProcessorDAO {

    @objc(addOutputObject:)
    @NSManaged public func addToOutput(_ value: ProcessorDAO)

    @objc(removeOutputObject:)
    @NSManaged public func removeFromOutput(_ value: ProcessorDAO)

    @objc(addOutput:)
    @NSManaged public func addToOutput(_ values: NSSet)

    @objc(removeOutput:)
    @NSManaged public func removeFromOutput(_ values: NSSet)

}

// MARK: Generated accessors for properties
extension ProcessorDAO {

    @objc(addPropertiesObject:)
    @NSManaged public func addToProperties(_ value: PropertyDAO)

    @objc(removePropertiesObject:)
    @NSManaged public func removeFromProperties(_ value: PropertyDAO)

    @objc(addProperties:)
    @NSManaged public func addToProperties(_ values: NSSet)

    @objc(removeProperties:)
    @NSManaged public func removeFromProperties(_ values: NSSet)

}
