//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Gleb Tregubov
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "cellID"
    
    let imageView: GradientImageView = {
        let image = GradientImageView(gradientLocations: [0.71, 1.0])
        image.layer.cornerRadius = 10.0
        image.layer.borderWidth = 1.0
        image.layer.borderColor = UIColor.black.cgColor
        image.clipsToBounds = true
//        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Rockwell", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        label.font = UIFont(name: "Rockwell", size: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func configureLayer() {
        layer.cornerRadius = 18.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func configureSubviews() {
        // image view layout
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0)
        ])
        
        imageView.addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -50),
            typeLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13),
            typeLabel.heightAnchor.constraint(equalToConstant: 14)
        ])

        imageView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15.0),
//            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 151.0),
            titleLabel.bottomAnchor.constraint(equalTo: typeLabel.topAnchor, constant: -3),
            titleLabel.heightAnchor.constraint(equalToConstant: 19.0)
        ])
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
