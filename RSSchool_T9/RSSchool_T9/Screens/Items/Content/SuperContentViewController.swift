//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Gleb Tregubov
// On: 04.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SuperContentViewController: UIViewController {
    
    var contentHeightConstraint: NSLayoutConstraint!
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        print("tapped")
    }
    
    let imageView: GradientImageView = {
        let image = GradientImageView(gradientLocations: [0.5, 1])
        image.layer.cornerRadius = 8.0
        image.layer.borderWidth = 1.0
        image.layer.borderColor = UIColor.white.cgColor
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Rockwell", size: 48.0)
        title.textColor = .white
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let typeLabel = TypesLabel(insets: UIEdgeInsets(top: 8.0, left: 30.0, bottom: 3.0, right: 30.0))
    
    let divider: UIView = {
        let divider = UIView()
        divider.layer.borderWidth = 1.0
        divider.layer.borderColor = UIColor.white.cgColor
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.configureScrollView()
        self.configureSubviews()
//        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
    }
    
    @objc private func dismissController() {
            self.dismiss(animated: true, completion: nil)
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // !Attention!
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
    }
    
    private func configureSubviews() {
        contentHeightConstraint = NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0.0)
        contentView.addSubview(dismissButton)
        contentView.addSubview(imageView)
        contentView.addSubview(typeLabel)
        contentView.addSubview(divider)
        
        imageView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30.0),
            dismissButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25.0),
            dismissButton.widthAnchor.constraint(equalToConstant: 40.0),
            dismissButton.heightAnchor.constraint(equalTo: dismissButton.widthAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 30.0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0), //
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.337),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30.0),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30.0),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 55.0),
            
            typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor),
            typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            divider.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 39),
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100)
        ])
    }
    

}
