//
//  CollectionViewCell.swift
//  HansCollectionViewInTableViewCell
//
//  Created by hans on 2018/4/4.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    let label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textColor = .red
        
        self.contentView.addSubview(label)
        
        self.label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
