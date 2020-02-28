//
//  TransformerComponent.swift
//  AstroImagerPlugin
//
//  Created by Don Willems on 27/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AstroImager

public protocol TransformerComponent : ProcessorComponent {
    func instantiateTransformer() -> Transformer
}
