//
//  Shadow.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

import UIKit

/// A simple struct to hold more reusable shadow properties and convenience methods
struct Shadow {
    
    /// The shadow color. Do not include alpha/opacity in this property.
    let color: UIColor
    
    /// The shadow's alpha channel amount
    let opacity: CGFloat
    
    /// The blur radius for the shadow
    let blur: CGFloat
    
    /// The x/y offset for the shadow
    let offset: CGSize
    
    /// Optional shadow path
    let path: CGPath?
    
    init(color: UIColor, opacity: CGFloat, blur: CGFloat, offset: CGSize, path: CGPath? = nil) {
        self.color = color
        self.opacity = opacity
        self.blur = blur
        self.offset = offset
        self.path = path
    }
    
    /// Will return the shadow as a `NSShadow` object
    ///
    /// - Returns: NSShadow
    func toNSShadow() -> NSShadow {
        let shadow = NSShadow()
        shadow.shadowColor = color.withAlphaComponent(opacity)
        shadow.shadowOffset = offset
        shadow.shadowBlurRadius = blur
        return shadow
    }
    
    /// Will apply the shadow to the given view's layer
    ///
    /// - Parameter view: The view to apply the shadow settings to
    func apply(toView view: UIView) {
        view.layer.shadowOffset = offset
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = Float(opacity)
        view.layer.shadowRadius = blur
        if let path = path {
            view.layer.shadowPath = path
        }
    }
}

