//
//  NetworkClass.swift
//  SamplePOC
//
//  Created by Jaya on 20/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    func getData(urlString: String?, completion: @escaping (Data?, Error?) -> Void) throws {
        guard let serviceUrlString = urlString else {
            throw ServiceError.invalidURL(message: ErrorMessage.invalidURLString)
        }
        guard let serviceURL = URL.init(string: serviceUrlString) else {
            throw ServiceError.invalidURL(message: ErrorMessage.invalidURL)
        }
        URLSession.shared.dataTask(with: serviceURL) {(data, _, error) in if let error = error {
                completion(nil, ServiceError.connectionError(message: ErrorMessage.connectionError + error.localizedDescription))
            }
            guard let data = data else {
                completion(nil, ServiceError.connectionError(message: ErrorMessage.invalidResponse))
                return
            }
            DispatchQueue.main.async {
                completion(data, nil)
            }
        }.resume()
    }
}
