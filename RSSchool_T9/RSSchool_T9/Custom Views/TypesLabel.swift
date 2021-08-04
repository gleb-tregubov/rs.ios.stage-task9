//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Gleb Tregubov
// On: 04.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class TypesLabel: UILabel {

    let insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets, textAlignment: NSTextAlignment = .center, numberOfLines: Int = 1) {
        self.insets = insets
        super.init(frame: .zero)
        layer.cornerRadius = 8.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.black.cgColor
        textColor = UIColor.white
        font = UIFont(name: "Rockwell-Regullar", size: 24.0)
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
}
