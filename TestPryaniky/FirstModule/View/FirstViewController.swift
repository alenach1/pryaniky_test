//
//  FirstViewController.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var presenter: FirstViewIPresenterInterface!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func registerNib() {
        let nib = UINib(nibName: NibName.generalTableViewCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ConfigurationCell.generalTableViewCell)
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.model?.view?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConfigurationCell.generalTableViewCell, for: indexPath) as! GeneralTableViewCell
        guard let arrayGeneralData = presenter.model?.view else {
            return UITableViewCell()
        }
        cell.configure(generalData: arrayGeneralData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SecondViewController()
        vc.model = presenter.model
        vc.modelType = presenter.model?.view?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FirstViewController: FirstViewInterface {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
