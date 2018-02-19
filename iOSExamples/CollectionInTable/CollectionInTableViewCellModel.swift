//
//  CollectionInTableViewCellModel.swift
//  iOSExamples
//
//  Created by Mitsuaki Ihara on 2018/02/11.
//  Copyright © 2018年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

class CollectionInTableViewCellModel: NSObject {
    
    private var matrixList: [matrix]!
    
    convenience init(matrixList: [matrix]) {
        self.init()
        
        self.matrixList = matrixList
    }
}

extension CollectionInTableViewCellModel: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matrixList.filter({ $0.index == 1 }).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionInTableViewCellCollectionViewCell",
                                                      for: indexPath) as! CollectionInTableViewCellCollectionViewCell
        cell.displayLabel.text = matrixList.filter({ $0.index == 1 && $0.number == (indexPath.row + 1) }).first?.number.description
        return cell
    }
}
