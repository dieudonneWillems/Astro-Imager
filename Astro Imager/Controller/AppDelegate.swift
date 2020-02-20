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
class AppDelegate: NSObject, NSApplicationDelegate {

    private var plugins = [AstroImagerPlugin]()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.loadPlugins()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    func loadPlugins() {
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
                    }
                }
            }
        } catch {
            Swift.print("Could not load plugins: \(error)")
        }
    }

    func createInstance<T>(typeThing:T.Type) -> T where T:AstroImagerPlugin {
        return typeThing.init()
    }
}

