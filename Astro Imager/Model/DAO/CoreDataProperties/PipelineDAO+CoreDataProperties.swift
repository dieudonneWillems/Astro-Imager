//
//  PipelineDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension PipelineDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PipelineDAO> {
        return NSFetchRequest<PipelineDAO>(entityName: "PipelineDAO")
    }

    @NSManaged public var processors: NSSet?

}

// MARK: Generated accessors for processors
extension PipelineDAO {

    @objc(addProcessorsObject:)
    @NSManaged public func addToProcessors(_ value: ProcessorDAO)

    @objc(removeProcessorsObject:)
    @NSManaged public func removeFromProcessors(_ value: ProcessorDAO)

    @objc(addProcessors:)
    @NSManaged public func addToProcessors(_ values: NSSet)

    @objc(removeProcessors:)
    @NSManaged public func removeFromProcessors(_ values: NSSet)

}
