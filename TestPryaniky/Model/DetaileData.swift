//
//  DetaileData.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation

struct DataileData: Decodable {
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [Variants]?
}
