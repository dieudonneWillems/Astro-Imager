//
//  GeneratorDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension GeneratorDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeneratorDAO> {
        return NSFetchRequest<GeneratorDAO>(entityName: "GeneratorDAO")
    }


}
