//
//  FirstViewIPresenterInterface.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation

protocol FirstViewInterface: class {
    func success()
    func failure(error: Error)
}

protocol FirstViewIPresenterInterface: class {
    init(view: FirstViewInterface, networkService: NetworkServiceInterface)
    func getModel()
    var model: Model? { get set }
}
