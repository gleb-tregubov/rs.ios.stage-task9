//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Gleb Tregubov
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GradientImageView: UIImageView {
    
    let gradientLocations: [NSNumber]

    init(gradientLocations: [NSNumber]) {
        self.gradientLocations = gradientLocations
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        if let sublayers = self.layer.sublayers {
            for sublayer in sublayers {
                if let gradientLayer = sublayer as? CAGradientLayer {
                    gradientLayer.removeFromSuperlayer()
                }
            }
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.72).cgColor]
        gradientLayer.locations = gradientLocations
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
