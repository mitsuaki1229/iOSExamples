//
//  lineIndexLabel.swift
//  iOSExamples
//
//  Created by Mitsuaki Ihara on 2018/02/18.
//  Copyright © 2018年 Mitsuaki Ihara. All rights reserved.
//

import UIKit

class LineIndexLabel: UILabel {
        
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)))
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width + 10, height: super.intrinsicContentSize.height + 10)
    }
}
