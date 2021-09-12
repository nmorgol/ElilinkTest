//
//  CollectionViewCell+Extension.swift
//  ElilinkTest
//
//  Created by Николай Морголь on 12.09.21.
//

import UIKit
extension StartCollectionViewCell{
    
    
    func makeActivityIndikatorView() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .black
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        activityIndicator.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return activityIndicator
    }
    
    func makeImageView() -> UIImageView {
        let startCellImageView = UIImageView()
        contentView.addSubview(startCellImageView)
        
        startCellImageView.translatesAutoresizingMaskIntoConstraints = false
        startCellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        startCellImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        startCellImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor,
                                                  multiplier: 10/10).isActive = true
        startCellImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor,
                                                  multiplier: 10/10).isActive = true
        startCellImageView.layer.cornerRadius = 7
        startCellImageView.clipsToBounds = true
        return startCellImageView
    }
}

