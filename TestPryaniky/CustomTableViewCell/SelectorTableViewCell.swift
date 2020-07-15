//
//  SelectorTableViewCell.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    func setupSegmentedControl(items: [Variants], selectedIndex: Int) {

        segmentedControl.removeAllSegments()
        for variant in items {
            guard let text = variant.text, let id = variant.id else { return }
            segmentedControl.insertSegment(withTitle: text, at: id, animated: true)
        }
        segmentedControl.selectedSegmentIndex = selectedIndex
        
            
        
    }
     func configure(data: [GeneralData]) {
           for elem in data {
               if elem.name == "selector" {
                guard let variants = elem.data?.variants, let selectedId = elem.data?.selectedId else { return }
                setupSegmentedControl(items: variants, selectedIndex: selectedId)
                break
               }
           }
       }
}
