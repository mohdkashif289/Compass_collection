//
//  ViewController.swift
//  Compass_collection
//
//  Created by Kashif Rizvi on 12/05/22.
//

import UIKit

protocol ImageCellDelegate: AnyObject {
    func getImage(for imageview: UIImageView, index: Int)
}

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "imagecell")
        let layout = UICollectionViewFlowLayout()
        let cellWidth = (view.bounds.width - 40) / 3
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 500
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagecell", for: indexPath) as! ImageCell
        cell.delegate = self
        cell.setupViews(index: indexPath.row)
        return cell
    }
    
    
}

extension ViewController: ImageCellDelegate {
    func getImage(for imageview: UIImageView, index: Int) {
        let cellheight = (view.bounds.width - 40) / 3
        NetworkService().fetchImage(key: String(index), index: Int(cellheight), imageview: imageview)
    }
    
}

