//
//  GeneralTableViewCell.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class GeneralTableViewCell: UITableViewCell {

    @IBOutlet weak var lable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(generalData: String) {
        lable.text = generalData
    }
}
