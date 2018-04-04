//
//  ViewController.swift
//  HansCollectionViewInTableViewCell
//
//  Created by hans on 2018/4/4.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import SnapKit
import SwiftRandom

protocol ControllerProtocol {
    func reloadView()
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ControllerProtocol {
    var tableView :UITableView?
    var dataArray :[[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView(frame: .zero, style: .plain)
        self.view.addSubview(tableView!)
        tableView?.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView?.dataSource = self
        tableView?.delegate  = self
        tableView?.estimatedRowHeight = 10
        tableView?.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
        
        let section = arc4random()%5 + 1
        for _ in 0...section {
            let item = arc4random()%20 + 1
            var array :[String] = []
            for _ in 0...item {
                let str = Randoms.randomFakeTag()
                array.append(str)
            }
            dataArray.append(array)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(test))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func test()  {
        dataArray.removeAll()
        let section = arc4random()%25 + 1
        for _ in 0...section {
            let item = arc4random()%25 + 1
            var array :[String] = []
            for _ in 0...item {
                let str = Randoms.randomFakeTag()
                array.append(str)
            }
            dataArray.append(array)
        }
        tableView?.reloadData()
//        tableView?.beginUpdates()
//        tableView?.endUpdates()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let item = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(test))
        self.navigationItem.leftBarButtonItems = [item]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 144
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell)!
        cell.setModel(dataArray1: dataArray[indexPath.row], reload: {[weak self] in
            self?.reloadView()
        })
        return cell
    }
    
    func reloadView() {
        self.tableView?.beginUpdates()
        self.tableView?.endUpdates()
    }

}

