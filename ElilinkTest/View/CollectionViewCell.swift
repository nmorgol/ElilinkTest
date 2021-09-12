//
//  CollectionViewCell.swift
//  ElilinkTest
//
//  Created by Николай Морголь on 12.09.21.
//

import UIKit

class StartCollectionViewCell: UICollectionViewCell {
    static let idintifire = "startCellId"
    
    
    
    lazy var startCellImageView = makeImageView()
    
    lazy var activityIndikator = makeActivityIndikatorView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
