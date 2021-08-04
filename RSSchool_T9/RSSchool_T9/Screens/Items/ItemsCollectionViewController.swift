//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Gleb Tregubov
// On: 03.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

private let reuseIdentifier = "Cell"

class ItemsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.cellID)

        self.configuringCollectionViewController()
    }
    
    // MARK: - Configuring root view of view controller
    private func configuringCollectionViewController() {
//        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }


    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return FillingData.data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.cellID, for: indexPath) as! ItemCollectionViewCell
    
        // Configure the cell
//        var content: ContentType
        switch FillingData.data[indexPath.row] {
        case .story(let story):
//            print("\(story.title), \(story.type)")
            cell.imageView.image = story.coverImage
            cell.titleLabel.text = story.title
            cell.typeLabel.text = story.type
        case .gallery(let gallery):
//            print("\(gallery.title), \(gallery.type)")
            cell.imageView.image = gallery.coverImage
            cell.titleLabel.text = gallery.title
            cell.typeLabel.text = gallery.type
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch FillingData.data[indexPath.row] {
        case .story(let story):
            let storyViewController = StoryContentViewController()
//            storyVC.story = story
            storyViewController.modalPresentationStyle = .fullScreen
            self.present(storyViewController, animated: true)
        case .gallery(let gallery):
            let galleryViewController = GalleryContentViewController()
//            galleryVC.gallery = gallery
            galleryViewController.modalPresentationStyle = .fullScreen
            self.present(galleryViewController, animated: true)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
