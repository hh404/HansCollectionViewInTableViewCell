//
//  TableViewCell.swift
//  HansCollectionViewInTableViewCell
//
//  Created by hans on 2018/4/4.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell,UICollectionViewDataSource {
    var collectionView :UICollectionView?
    var dataArray :[String]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.contentView.addSubview(collectionView!)
        collectionView?.dataSource = self
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
        })
        collectionView?.isScrollEnabled = false
        collectionView?.backgroundColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("--------",collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell :CollectionViewCell = (self.collectionView?.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell)!
        cell.label.textColor = UIColor.random()
        cell.label.text = dataArray?[indexPath.item]
        return cell
    }

    func setModel(dataArray1 :[String],reload :()->()) {
        self.dataArray = dataArray1
        self.contentView.setNeedsLayout()
        reload()
        //let vc :ViewController = self.viewController as! ViewController
        //vc.reloadView()
        //self.viewController.re
        //self.collectionView?.reloadData()
    }
    
    
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 1)
        self.collectionView?.layoutIfNeeded()
        print("++++++++++++++++",collectionView)
        return (collectionView?.collectionViewLayout.collectionViewContentSize)!
    }
}

extension UIView {
    var viewController: UIViewController? {
        var next = self.superview
        while (next != nil) {
            let nextResponder: UIResponder? = next?.next
            if (nextResponder is UIViewController) {
                return nextResponder as? UIViewController
            }
            next = next?.superview
        }
        return nil
    }
}


