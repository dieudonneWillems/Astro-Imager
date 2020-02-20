//
//  MetaPlugin.swift
//  AstroImagerPlugin
//
//  Created by Don Willems on 16/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit

public enum PluginServiceType : String {
    case generator
    case transformer
    case serializer
    case viewer
    case viewLayer
}

public struct MetaPlugin {
    
    public let pluginServices : [PluginService]
    public let name : String
    public let description : String
    
    public init?(principialClass: AnyClass) {
        var services = [PluginService]()
        let plugin = Bundle(for: principialClass)
        let plistURL = plugin.url(forResource: "plugin", withExtension: "plist")
        if plistURL == nil {
            print("Could not load contents of plugin \(plugin.bundlePath)")
            return nil
        }
        let properties = NSDictionary(contentsOf: plistURL!)
        if properties == nil {
            print("Could not load properties of plugin \(plugin.bundlePath)")
            return nil
        }
        self.name = properties!["name"] as! String
        self.description = properties!["description"] as! String
        let serviceArray = properties!["services"] as! NSArray
        for serviceDict in serviceArray {
            let dict = serviceDict as! NSDictionary
            let sname = dict["name"] as! String
            let sdescription = dict["description"] as! String
            let iconURL = plugin.url(forResource: "icon", withExtension: "png")
            var icon : NSImage? = nil
            if iconURL != nil {
                icon = NSImage(contentsOf: iconURL!)
            }
            let stypestr = dict["type"] as! String
            var stype : PluginServiceType?
            if stypestr == PluginServiceType.generator.rawValue {
                stype = PluginServiceType.generator
            } else if stypestr == PluginServiceType.transformer.rawValue {
                stype = PluginServiceType.transformer
            } else if stypestr == PluginServiceType.serializer.rawValue {
                stype = PluginServiceType.serializer
            } else if stypestr == PluginServiceType.viewer.rawValue {
                stype = PluginServiceType.viewer
            } else if stypestr == PluginServiceType.viewLayer.rawValue {
                stype = PluginServiceType.viewLayer
            }
            if stype != nil {
                let service = PluginService(name: sname, description: sdescription, icon: icon, type: stype!)
                services.append(service)
            }
        }
        self.pluginServices = services
    }
    
    public func pluginServices(ofType type: PluginServiceType) -> [String : PluginService] {
        var services = [String : PluginService]()
        for service in pluginServices {
            if service.type == type {
                services[service.name] = service
            }
        }
        return services
    }
}

public struct PluginService {
    
    public let type : PluginServiceType
    public let name : String
    public let description : String
    public let icon : NSImage?
    
    init(name: String, description: String, icon: NSImage?, type: PluginServiceType) {
        self.type = type
        self.name = name
        self.description = description
        self.icon = icon
    }
}
