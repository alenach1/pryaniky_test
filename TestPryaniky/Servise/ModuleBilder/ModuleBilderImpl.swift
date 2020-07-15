//
//  ModuleBilderImpl.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class ModuleBilderImpl: ModuleBilderInterface {
    static func createVC() -> UIViewController {
        let vc = FirstViewController()
        let networkService = NetworkServiceImpl()
        let presenter = FirstViewPresenterImpl(view: vc, networkService: networkService)
        vc.presenter = presenter
        return vc
    }
}
