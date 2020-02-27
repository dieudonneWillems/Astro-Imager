//
//  DefaultPipeline.swift
//  AstroImager
//
//  Created by Don Willems on 23/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit

public class DefaultPipeline : Pipeline {
    
    public var name: String
    
    public var description: String
     
    public var icon: NSImage
    
    private var generatorsByName = [String]()
    private var transformersByName = [String]()
    private var serializersByName = [String]()
    
    public private(set) var generators: [Generator] = [Generator]()
    
    public private(set) var transformers: [Transformer] = [Transformer]()
    
    public private(set) var serializers: [Serializer] = [Serializer]()
    
    public var pluginProvider: PluginProvider?
    
    public init(name: String, description: String, icon: NSImage) {
        self.name = name
        self.description = description
        self.icon = icon
    }
    
    public func add(generator name: String) {
        self.generatorsByName.append(name)
    }
    
    public func remove(generatorAt index: Int) {
        if self.generators.count > index {
            self.generators.remove(at: index)
        }
        self.generatorsByName.remove(at: index)
    }
    
    public func add(transformer name: String) {
        self.transformersByName.append(name)
    }
    
    public func remove(transformerAt index: Int) {
        if self.transformers.count > index {
            self.transformers.remove(at: index)
        }
        self.transformersByName.remove(at: index)
    }
    
    public func add(serializer name: String) {
        self.serializersByName.append(name)
    }
    
    public func remove(serializerAt index: Int) {
        if self.serializers.count > index {
            self.serializers.remove(at: index)
        }
        self.serializersByName.remove(at: index)
    }
    
    public var isRunning: Bool = false
    private var isLoaded: Bool = false
    
    public func load() -> Bool {
        if !isLoaded {
            if pluginProvider != nil {
                pluginProvider!.loadPlugins()
                for name in self.generatorsByName {
                    let generator = pluginProvider!.generator(with: name)
                    if generator != nil {
                        self.generators.append(generator!)
                    } else {
                        return false
                    }
                }
                for name in self.transformersByName {
                    let transformer = pluginProvider!.transformer(with: name)
                    if transformer != nil {
                        self.transformers.append(transformer!)
                    } else {
                        return false
                    }
                }
                for name in self.serializersByName {
                    let serializer = pluginProvider!.serializer(with: name)
                    if serializer != nil {
                        self.serializers.append(serializer!)
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
