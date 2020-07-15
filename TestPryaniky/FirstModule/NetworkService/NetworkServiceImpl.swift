//
//  NetworkServiceImpl.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation

class NetworkServiceImpl: NetworkServiceInterface {
    
    func getModel(completion: @escaping (Result<Model?, Error>) -> ()) {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response ,error in
            if let error = error {
                completion(.failure(error))
                return
            }
    
            guard let data = data else { return }

            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                completion(.success(model))
                print(model)
            } catch {
                completion(.failure(error))
            }
        }.resume()
}
}
