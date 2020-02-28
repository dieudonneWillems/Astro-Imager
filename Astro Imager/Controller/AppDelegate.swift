//
//  AppDelegate.swift
//  Astro Imager
//
//  Created by Don Willems on 14/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Cocoa
import AstroImager
import AstroImagerPlugin

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, PluginProvider {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.loadPlugins()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    // MARK: - Plugin Provider
    
    private var plugins = [AstroImagerPlugin]()
    
    public private(set) var availableGeneratorComponents = [GeneratorComponent]()
    public private(set) var availableTransformerComponents = [TransformerComponent]()
    public private(set) var availableSerializerComponents = [SerializerComponent]()
    
    public func processorComponent(with identifier: UUID) -> ProcessorComponent? {
        let generatorComponent = self.generatorComponent(with: identifier)
        if generatorComponent != nil {
            return generatorComponent
        }
        let transformerComponent = self.transformerComponent(with: identifier)
        if transformerComponent != nil {
            return transformerComponent
        }
        let serializerComponent = self.serializerComponent(with: identifier)
        if serializerComponent != nil {
            return serializerComponent
        }
        return nil
    }
    
    public func generatorComponent(name: String) -> GeneratorComponent? {
        for generatorComponent in availableGeneratorComponents {
            if generatorComponent.name == name {
                return generatorComponent
            }
        }
        return nil
    }
    
    public func generatorComponent(with identifier: UUID) -> GeneratorComponent? {
        return processorComponent(with: identifier, from: availableGeneratorComponents) as? GeneratorComponent
    }
    
    public func transformerComponent(name: String) -> TransformerComponent? {
        for transformerComponent in availableTransformerComponents {
            if transformerComponent.name == name {
                return transformerComponent
            }
        }
        return nil
    }
    
    public func transformerComponent(with identifier: UUID) -> TransformerComponent? {
        return processorComponent(with: identifier, from: availableTransformerComponents) as? TransformerComponent
    }
    
    public func serializerComponent(name: String) -> SerializerComponent? {
        for serializerComponent in availableSerializerComponents {
            if serializerComponent.name == name {
                return serializerComponent
            }
        }
        return nil
    }
    
    public func serializerComponent(with identifier: UUID) -> SerializerComponent? {
        return processorComponent(with: identifier, from: availableSerializerComponents) as? SerializerComponent
    }
    
    private func processorComponent(with identifier: UUID, from array: [ProcessorComponent]) -> ProcessorComponent? {
        for processorComponent in array {
            print("compare UUIDs: \(processorComponent.identifier) == \(identifier)")
            if processorComponent.identifier == identifier {
                return processorComponent
            }
        }
        return nil
    }
    
    // MARK: - Outlets
    
    
    // MARK: - Menu Actions
    

    // MARK: - Plugins
    
    public private(set) var pluginsAreLoaded = false
    
    public func reloadPlugins() {
        pluginsAreLoaded = false
        self.plugins.removeAll()
        self.availableGeneratorComponents.removeAll()
        self.availableTransformerComponents.removeAll()
        self.availableSerializerComponents.removeAll()
        loadPlugins()
    }
    
    func loadPlugins() {
        if pluginsAreLoaded {
            return
        }
        let path = Bundle.main.bundlePath
        // TODO: looking in current directory - should be in bundle in the future
        let uri = URL(fileURLWithPath: path).deletingLastPathComponent()
        do {
            let fileList = try FileManager.default.contentsOfDirectory(at: uri, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for url in fileList {
                if url.pathExtension == "plugin" {
                    let plugin = Bundle(url: url)
                    let principalClass : AnyClass? = plugin?.principalClass
                    if (principalClass as? AstroImagerPlugin.Type) != nil {
                        let pluginInstance: AstroImagerPlugin = (principalClass as? AstroImagerPlugin.Type)!.init()
                        self.plugins.append(pluginInstance)
                        let processorComponents = pluginInstance.processorComponents
                        for processorComponent in processorComponents {
                            if (processorComponent as? GeneratorComponent) != nil {
                                availableGeneratorComponents.append(processorComponent as! GeneratorComponent)
                            } else if (processorComponent as? TransformerComponent) != nil {
                                availableTransformerComponents.append(processorComponent as! TransformerComponent)
                            } else if (processorComponent as? SerializerComponent) != nil {
                                availableSerializerComponents.append(processorComponent as! SerializerComponent)
                            }
                        }
                    }
                    print("Loaded plugin at: \(url)")
                }
            }
            pluginsAreLoaded = true
        } catch {
            Swift.print("Could not load plugins: \(error)")
        }
    }

    func createInstance<T>(typeThing:T.Type) -> T where T:AstroImagerPlugin {
        return typeThing.init()
    }
}

