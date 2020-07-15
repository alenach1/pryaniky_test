//
//  FirstViewPresenterImpl.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation

class FirstViewPresenterImpl: FirstViewIPresenterInterface {
 
    var model: Model?
    
    weak var view: FirstViewInterface?
    let networkService:NetworkServiceInterface
    
    required init(view: FirstViewInterface, networkService: NetworkServiceInterface) {
        self.view = view
        self.networkService = networkService
        getModel()
    }
    func getModel() {
        networkService.getModel { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.model = model
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
            
        }
    }
    
    
    
}
