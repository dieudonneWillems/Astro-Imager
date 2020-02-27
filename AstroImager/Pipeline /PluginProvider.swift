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
    
    func generator(with name: String) -> Generator?
    func transformer(with name: String) -> Transformer?
    func serializer(with name: String) -> Serializer?
}
