//
//  PluginProvider.swift
//  AstroImager
//
//  Created by Don Willems on 24/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation

public protocol PluginProvider {
    
    func loadPlugins()
    
    func processorComponent(with identifier: UUID) -> ProcessorComponent?
    func generatorComponent(with identifier: UUID) -> GeneratorComponent?
    func transformerComponent(with identifier: UUID) -> TransformerComponent?
    func serializerComponent(with identifier: UUID) -> SerializerComponent?
}
