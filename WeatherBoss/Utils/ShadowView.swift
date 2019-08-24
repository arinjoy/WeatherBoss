//
//  ShadowView.swift
//  WeatherBoss
//
//  Created by BISWAS, Arinjoy on 24/8/19.
//  Copyright © 2019 ArinAppy. All rights reserved.
//

/// A custom view with shadows appled to certain sides.
final class ShadowSideView: UIView {
    
    /// The side of the view to which shadow will be applied.
    var side: ShadowSide = .none
    
    /// The color of the shadow.
    var shadowColor: UIColor = .black15
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addShadow(for: side, shadowColor: shadowColor)
    }
}

/// The side of the view where shadow will be applied to.
enum ShadowSide {
    case top
    case bottom
    case none
}

