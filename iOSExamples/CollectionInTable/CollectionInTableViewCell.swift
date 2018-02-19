//
//  CollectionInTableViewCell.swift
//  iOSExamples
//
//  Created by Mitsuaki Ihara on 2018/02/11.
//  Copyright © 2018年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

class CollectionInTableViewCell: UITableViewCell {
    
    let lineIndexLabel = LineIndexLabel()
    private var collectionView: UICollectionView!
    private var viewCellModel: CollectionInTableViewCellModel!
    var matrixList = [matrix(index: 0, number: 0)]
    
    private let flowLayout = { (frame: CGRect) -> UICollectionViewFlowLayout in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: frame.height/1.2, height: frame.height/1.2)
        layout.scrollDirection = .horizontal
        return layout
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("required init?(coder aDecoder: NSCoder)")
    }
    
    convenience init(matrixList: [matrix]) {
        self.init(style: .default, reuseIdentifier: nil)
        
        viewCellModel = CollectionInTableViewCellModel(matrixList: matrixList)
        
        addSubview(lineIndexLabel)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout(frame))
        addSubview(collectionView)
        
        lineIndexLabel.textAlignment = .center
        lineIndexLabel.backgroundColor = .gray
        lineIndexLabel.layer.borderColor = UIColor.black.cgColor
        lineIndexLabel.layer.borderWidth = 2.0
        
        lineIndexLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        lineIndexLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        lineIndexLabel.rightAnchor.constraint(equalTo: collectionView.leftAnchor, constant: 0).isActive = true
        lineIndexLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        lineIndexLabel.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: lineIndexLabel.rightAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        collectionView.register(CollectionInTableViewCellCollectionViewCell.self,
                                forCellWithReuseIdentifier: "CollectionInTableViewCellCollectionViewCell")
        collectionView.dataSource = viewCellModel
        collectionView.delegate = self
    }
}

extension CollectionInTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "",
                                      message: "didSelectItemAt " + indexPath.row.description + ".",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        
        
        var vc = UIApplication.shared.keyWindow?.rootViewController
        while ((vc?.presentedViewController) != nil) {
            vc = vc?.presentedViewController
        }
        
        vc?.present(alert,
                    animated: false,
                    completion: nil)
    }
}
