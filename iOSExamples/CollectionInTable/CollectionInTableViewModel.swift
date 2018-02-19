//
//  CollectionInTableViewModel.swift
//  iOSExamples
//
//  Created by Mitsuaki Ihara on 2018/02/17.
//  Copyright © 2018年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

struct matrix {
    var index: Int
    var number: Int
}

class CollectionInTableViewModel: NSObject {
    
    private var matrixList = [matrix(index: 0, number: 0)]
    
    override init() {
        super.init()
        
        for i in 0...14 {
            for j in 1...15 {
                matrixList.append(matrix(index: i, number: j))
            }
        }
        matrixList.removeFirst()
    }
}

extension CollectionInTableViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matrixList.filter({ $0.number == 1 }).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = CollectionInTableViewCell(matrixList: matrixList)
        let matrix = matrixList.filter({ $0.index == indexPath.row && $0.number == 1 }).first
        cell.lineIndexLabel.text = matrix?.index.description
        return cell
    }
}
