//
//  NetworkServiceInterface.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation

protocol NetworkServiceInterface {
   func getModel(completion: @escaping (Result<Model?, Error>) -> ())
}
