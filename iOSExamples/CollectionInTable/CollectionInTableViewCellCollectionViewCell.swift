//
//  CollectionInTableViewCellCollectionViewCell.swift
//  iOSExamples
//
//  Created by Mitsuaki Ihara on 2018/02/11.
//  Copyright © 2018年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

class CollectionInTableViewCellCollectionViewCell: UICollectionViewCell {
    
    let displayLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(displayLabel)
        
        displayLabel.textAlignment = .center
        
        displayLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        displayLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true        
        displayLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        displayLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("required init?(coder aDecoder: NSCoder)")
    }
}
