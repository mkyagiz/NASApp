//
//  PhotoCollectionViewCell.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 2.03.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    let photo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    fileprivate func setupUI() {
        addSubview(photo)
        photo.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        photo.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        photo.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
