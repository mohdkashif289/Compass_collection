//
//  ImageCell.swift
//  Compass_collection
//
//  Created by Kashif Rizvi on 12/05/22.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    weak var delegate: ImageCellDelegate?
    
    func setupViews(index: Int) {
        
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = false
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = false
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = false
        
        delegate?.getImage(for: imageView, index: index)
        
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
}
