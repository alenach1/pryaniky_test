//
//  TestPryanikyTests.swift
//  TestPryanikyTests
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import XCTest
@testable import TestPryaniky

class MockView: FirstViewInterface {
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
}

class MockNetworkService: NetworkServiceInterface {
    var model: Model!
    
    init() {}
    
    convenience init(model: Model) {
        self.init()
        self.model = model
    }
    func getModel(completion: @escaping (Result<Model?, Error>) -> ()) {
        if let model = model {
            completion(.success(model))
        } else {
            let error = NSError(domain: "Ошибка", code: 9, userInfo: nil)
            completion(.failure(error))
        }
    }
    
    
}

class TestPryanikyTests: XCTestCase {
    
    var view: MockView!
    var presenter: FirstViewPresenterImpl!
    var networkService: NetworkServiceInterface!
    var model = Model()

    override func setUp() {
      
    }

    override func tearDown() {
        view = nil
        presenter = nil
        networkService = nil
    }
    
    func testGetSuccessModel() {
        let model = Model(data: [GeneralData(name: "Tor", data: DataileData(text: "Lom", url: "Lol", selectedId: 2, variants: [Variants(id: 9, text: "Kek")]))], view: ["Bra", "Gol","Gaf"])
        
        view = MockView()
        networkService = MockNetworkService(model: model)
        presenter = FirstViewPresenterImpl(view: view, networkService: networkService)
        var catchModel = [Model]()
        
        networkService.getModel { result in
            switch result {
            case .success(let model):
                catchModel.append(model!)
            case . failure(let error):
                print(error)
            }
        }
        XCTAssertNotEqual(catchModel.count, 0)
        
        
        
    }

}
