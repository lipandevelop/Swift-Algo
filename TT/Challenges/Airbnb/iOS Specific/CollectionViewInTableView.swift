//
//  CollectionViewInTableView.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import UIKit

let tCell = "tCell"
let cCell = "cCell"

class MyViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: tCell)
        tableView.dataSource = self
        tableView.rowHeight = 250
        tableView.reloadData()
        view.addSubview(tableView)
        
    }
    
}

extension MyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tCell, for: indexPath) as! MyTableViewCell
        
        cell.elementArray = ["a", "b", "c", "d", "e", "f"]
        
        return cell
        
    }
    
}

class MyTableViewCell: UITableViewCell, UICollectionViewDataSource {
    
    var elementArray: [String] = [] {
        didSet {
            configureCollectionView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCollectionView () {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 250, height: 250)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250), collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cCell)
        collectionView.dataSource = self
        collectionView.reloadData()
        
        contentView.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elementArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cCell, for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}
