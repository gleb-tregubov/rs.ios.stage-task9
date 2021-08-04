//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Gleb Tregubov
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [configuringItemsViewController()] // + SETTINGS VIEW CONTROLLER

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Settingup ChildVC settingsViewController For Tab Bar
    // SETTINGS VIEW CONTROLLER
    
    
    //MARK: - Settingup ChildVC itemsViewController For Tab Bar
    private func configuringItemsViewController() -> ItemsCollectionViewController {
        let itemsViewController = ItemsCollectionViewController(collectionViewLayout: configuringFlowLayout())
        itemsViewController.tabBarItem = UITabBarItem(title: "Items", image: UIImage(systemName: "square.grid.2x2"), tag: 0)
        return itemsViewController
    }
    
    //MARK: - Provide Flow Layout For items Collection View Controller
    private func configuringFlowLayout() -> UICollectionViewFlowLayout {
        let layoutWidth                       = UIScreen.main.bounds.width
        let layoutPadding: CGFloat            = 20.0
        let layoutMinumumItemSpacing: CGFloat = 16.0
        let layoutAspectRatio: CGFloat        = 1.223
        let layoutAvailableSpace              = layoutWidth - (2 * layoutPadding) - (layoutMinumumItemSpacing)
        let layoutItemWidth                   = layoutAvailableSpace / 2
        
        let flowLayout                = UICollectionViewFlowLayout()
        flowLayout.sectionInset       = UIEdgeInsets(top: layoutPadding, left: layoutPadding, bottom: layoutPadding, right: layoutPadding)
        flowLayout.itemSize           = CGSize(width: layoutItemWidth, height: layoutItemWidth * layoutAspectRatio)
        flowLayout.minimumLineSpacing = 30.0
        
        return flowLayout
    }
    

}
