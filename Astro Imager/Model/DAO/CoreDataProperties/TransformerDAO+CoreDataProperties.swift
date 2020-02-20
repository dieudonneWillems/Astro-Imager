//
//  TransformerDAO+CoreDataProperties.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//
//

import Foundation
import CoreData


extension TransformerDAO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransformerDAO> {
        return NSFetchRequest<TransformerDAO>(entityName: "TransformerDAO")
    }


}
