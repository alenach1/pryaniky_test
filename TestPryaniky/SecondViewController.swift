//
//  SecondViewController.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var model: Model?
    var modelType: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setupTableView()
    }
    fileprivate func setupTableView() {
        tableView.tableFooterView = UIView()
    }

}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let arrayCells = model?.view, let data = model?.data else { return UITableViewCell() }
        
            if modelType == "hz" {
                let cell = tableView.dequeueReusableCell(withIdentifier: ConfigurationCell.hzTableViewCell, for: indexPath) as! HzTableViewCell
                cell.configure(data: data)
                return cell
            } else if modelType == "picture" {
                let cell = tableView.dequeueReusableCell(withIdentifier: ConfigurationCell.pictureTableViewCell, for: indexPath) as! PictureTableViewCell
                cell.configure(data: data)
                return cell
            } else if modelType == "selector" {
                let cell = tableView.dequeueReusableCell(withIdentifier: ConfigurationCell.selectorTableViewCell, for: indexPath) as! SelectorTableViewCell
                cell.configure(data: data)
                return cell
            } else {
                return UITableViewCell()
        }
   
    }
    
    fileprivate func registerNib() {
        let nib = UINib(nibName: NibName.hzTableViewCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ConfigurationCell.hzTableViewCell)
        
        let nib1 = UINib(nibName: NibName.pictureTableViewCell, bundle: nil)
               tableView.register(nib1, forCellReuseIdentifier: ConfigurationCell.pictureTableViewCell)
        
        let nib2 = UINib(nibName: NibName.selectorTableViewCell, bundle: nil)
               tableView.register(nib2, forCellReuseIdentifier: ConfigurationCell.selectorTableViewCell)
        
    }

}
