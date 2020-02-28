//
//  DefaultPipeline.swift
//  AstroImager
//
//  Created by Don Willems on 23/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AstroImager
import AppKit

public class DefaultPipeline : Pipeline {
    
    public var name: String
    
    public var description: String
     
    public var icon: NSImage
    
    public var pluginProvider : PluginProvider?
    
    private var generatorsByIdentifier = [UUID]()
    private var transformersByIdentifier = [UUID]()
    private var serializersByIdentifier = [UUID]()
    
    public private(set) var generators: [Generator] = [Generator]()
    
    public private(set) var transformers: [Transformer] = [Transformer]()
    
    public private(set) var serializers: [Serializer] = [Serializer]()
    
    public init(name: String, description: String, icon: NSImage) {
        self.name = name
        self.description = description
        self.icon = icon
    }
    
    public func add(generatorFromComponent identifier: UUID) {
        self.generatorsByIdentifier.append(identifier)
        self.isLoaded = false
    }
    
    public func remove(generatorAt index: Int) {
        if self.generators.count > index {
            self.generators.remove(at: index)
        }
        self.generatorsByIdentifier.remove(at: index)
        self.isLoaded = false
    }
    
    public func add(transformerFromComponent identifier: UUID) {
        self.transformersByIdentifier.append(identifier)
        self.isLoaded = false
    }
    
    public func remove(transformerAt index: Int) {
        if self.transformers.count > index {
            self.transformers.remove(at: index)
        }
        self.transformersByIdentifier.remove(at: index)
        self.isLoaded = false
    }
    
    public func add(serializerFromComponent identifier: UUID) {
        self.serializersByIdentifier.append(identifier)
        self.isLoaded = false
    }
    
    public func remove(serializerAt index: Int) {
        if self.serializers.count > index {
            self.serializers.remove(at: index)
        }
        self.serializersByIdentifier.remove(at: index)
        self.isLoaded = false
    }
    
    public var isRunning: Bool = false
    private var isLoaded: Bool = false
    
    public func load() -> Bool {
        if !isLoaded {
            if pluginProvider != nil {
                pluginProvider!.loadPlugins()
                for id in self.generatorsByIdentifier {
                    let generatorComponent = pluginProvider!.generatorComponent(with: id)
                    if generatorComponent != nil {
                        let generator = generatorComponent!.instantiateGenerator()
                        self.generators.append(generator)
                    } else {
                        return false
                    }
                }
                for id in self.transformersByIdentifier {
                    let transformerComponent = pluginProvider!.transformerComponent(with: id)
                    if transformerComponent != nil {
                        let transformer = transformerComponent!.instantiateTransformer()
                        self.transformers.append(transformer)
                    } else {
                        return false
                    }
                }
                for id in self.serializersByIdentifier {
                    let serializerComponent = pluginProvider!.serializerComponent(with: id)
                    if serializerComponent != nil {
                        let serializer = serializerComponent!.instantiateSerializer()
                        self.serializers.append(serializer)
                    } else {
                        return false
                    }
                }
            }
            isLoaded = true
        }
        return isLoaded
    }
    
    public func run() -> Bool {
        if isLoaded && !isRunning {
            
            return true
        }
        return false
    }
    
    public func stop() {
        
    }
}
