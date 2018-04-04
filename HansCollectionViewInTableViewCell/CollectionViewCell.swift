//
//  CollectionViewCell.swift
//  HansCollectionViewInTableViewCell
//
//  Created by hans on 2018/4/4.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import SnapKit
import SwiftRandom

class CollectionViewCell: UICollectionViewCell {
    let label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textColor = .red
        label.layer.cornerRadius = 5
        label.layer.borderColor = UIColor.random().cgColor
        label.layer.borderWidth = 1
        self.contentView.addSubview(label)
        
        self.label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
