//
//  AstroImage.swift
//  Astro Imager
//
//  Created by Don Willems on 15/02/2020.
//  Copyright © 2020 lapsedpacifist. All rights reserved.
//

import Foundation
import AppKit

public enum ImageType : String {
    case darkFrame = "dark frame"
    case biasFrame = "bias frame"
    case flatFrame = "flat frame"
    case lightFrame = "light frame"
    case mixedSet = "mixed set"
    case unknown = "unkown"
}

public struct Filter {
    
    public static let red = Filter(name: "red (RGB)", wavelength:572)
    public static let green = Filter(name: "green (RGB)", wavelength:540)
    public static let blue = Filter(name: "blue (RGB)", wavelength:430)
    
    public static let U = Filter(name: "U", wavelength:365, FWHM: 66)
    public static let B = Filter(name: "B", wavelength:445, FWHM: 94)
    public static let V = Filter(name: "V", wavelength:551, FWHM: 88)
    public static let G = Filter(name: "G", wavelength:464, FWHM: 128)
    public static let R = Filter(name: "R", wavelength:658, FWHM: 138)
    public static let I = Filter(name: "I", wavelength:806, FWHM: 149)
    public static let Z = Filter(name: "Z", wavelength:900)
    public static let Y = Filter(name: "Y", wavelength:1020, FWHM: 120)
    public static let J = Filter(name: "J", wavelength:1220, FWHM: 213)
    public static let K = Filter(name: "K", wavelength:2190, FWHM: 390)
    public static let L = Filter(name: "L", wavelength:3450, FWHM: 472)
    
    public static let Hα = Filter(name: "Hα", wavelength:656)
    public static let Hβ = Filter(name: "Hβ", wavelength:486)
    public static let OIII = Filter(name: "OIII", wavelengths:[496,501])
    public static let SII = Filter(name: "SII", wavelength:672)
    /**
     * The name of the filter.
     */
    public let name : String
    
    /**
     * The effective wavelength midpoint of the filter in nanometres (nm) or the wavelengths of the spectral lines for
     * which the filter is transparent.
     */
    public let wavelengths : [Float]
    
    /**
     * The Full Width Half Maximum (bandwith) of the filter in nanometres (nm).
     */
    public let FWHM : Float?
    
    public init(name: String, wavelength: Float, FWHM: Float? = nil) {
        self.name = name;
        self.wavelengths = [wavelength]
        self.FWHM = FWHM
    }
    
    public init(name: String, wavelengths: [Float]) {
        self.name = name;
        self.wavelengths = wavelengths
        self.FWHM = nil
    }
}

public struct AstroImage {
    
    public let filter : Filter?
    
    public var fileURL : URL? {
        willSet(newValue) {
            if !imageIsLoadedInMemory {
                self.loadImage()
            }
            // TODO: Write the image to the new path
        }
    }
    
    private var loadedImage : CIImage? = nil
    
    public var imageIsLoadedInMemory : Bool {
        get {
            return loadedImage != nil
        }
    }
    
    private func loadImage() {
        // TODO: Load image
    }
    
    public init?(named name: NSImage.Name, with filter: Filter? = nil) {
        let image = NSImage(named: name)
        if image == nil {
            return nil
        }
        self.init(from: image!, with: filter)
    }
    
    public init?(from image: NSImage, with filter: Filter? = nil) {
        let data = image.tiffRepresentation
        if data == nil {
            return nil
        }
        self.init(from: data!, with: filter)
    }
    
    public init?(from data: Data, with filter: Filter? = nil) {
        let ciimage = CIImage(data: data)
        if ciimage == nil {
            return nil
        }
        self.init(from: ciimage!, with: filter)
    }
    
    public init(from image: CIImage, with filter: Filter? = nil) {
        self.loadedImage = image
        self.filter = filter
    }
}
