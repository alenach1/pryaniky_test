//
//  HzTableViewCell.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class HzTableViewCell: UITableViewCell {

    @IBOutlet weak var lable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(data: [GeneralData]) {
        for elem in data {
            if elem.name == "hz" {
                guard let dataileData = elem.data?.text else { return }
                lable.text = dataileData
            }
        }
    }
}
