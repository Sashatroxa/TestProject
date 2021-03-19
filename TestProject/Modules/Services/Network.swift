//
//  Network.swift
//  TestProject
//
//  Created by Александр on 15.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

enum NewResult<Value>{
    case success(Value)
    case failure(Error)
}

func fetchData(completion: ((NewResult<MainModel>) -> Void)?){
    
    let url = URL(string: "https://api.mocki.io/v1/bb71653c")
    if let url = url {
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    do {
                        let address = try decoder.decode(MainModel.self, from: jsonData)
                        completion?(.success(address))
                    } catch {
                        completion?(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
