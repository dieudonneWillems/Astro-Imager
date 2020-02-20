//
//  AstroImageDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension AstroImageDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AstroImageDAO> {
        return NSFetchRequest<AstroImageDAO>(entityName: "AstroImageDAO")
    }

    @NSManaged public var channelString: String?
    @NSManaged public var date: Date?
    @NSManaged public var height: Int64
    @NSManaged public var integrationTime: Double
    @NSManaged public var isBiasFrame: Bool
    @NSManaged public var isDarkFrame: Bool
    @NSManaged public var isFlatFrame: Bool
    @NSManaged public var isLightFrame: Bool
    @NSManaged public var isRGB: Bool
    @NSManaged public var name: String?
    @NSManaged public var sequenceNumber: Int64
    @NSManaged public var thumbnail: Data?
    @NSManaged public var uri: URL?
    @NSManaged public var width: Int64
    @NSManaged public var inStackedImage: StackedImageDAO?
    @NSManaged public var properties: NSSet?
    @NSManaged public var set: ImageSetDAO?
    @NSManaged public var transformation: ImageTransformDAO?

}

// MARK: Generated accessors for properties
extension AstroImageDAO {

    @objc(addPropertiesObject:)
    @NSManaged public func addToProperties(_ value: PropertyDAO)

    @objc(removePropertiesObject:)
    @NSManaged public func removeFromProperties(_ value: PropertyDAO)

    @objc(addProperties:)
    @NSManaged public func addToProperties(_ values: NSSet)

    @objc(removeProperties:)
    @NSManaged public func removeFromProperties(_ values: NSSet)

}
