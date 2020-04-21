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
    
    func getData(UrlString: String?, completion: @escaping (Data?, Error?) -> Void) throws{
        guard let serviceUrlString = UrlString else {
            throw ServiceError.invalidURL(message: ErrorMessage.invalidURLString)
        }
        guard let serviceURL = URL.init(string: serviceUrlString) else {
            throw ServiceError.invalidURL(message: ErrorMessage.invalidURL)
        }
        URLSession.shared.dataTask(with: serviceURL) { (data, response
            , error) in
            if let error = error {
                completion(nil,ServiceError.connectionError(message: ErrorMessage.connectionError + error.localizedDescription))
            }
            guard let data = data else {
                completion(nil,ServiceError.connectionError(message: ErrorMessage.invalidResponse))
                return
            }
            DispatchQueue.main.async {
                completion(data, nil)
            }
        }.resume()
    }
    
//    func getData(UrlString: String, completion: @escaping (CountryInfo?, Error?) -> Void) throws{
//        var countryData: CountryInfo?
//        guard let serviceURL = URL.init(string: UrlString) else {
//            throw ServiceError.invalidURL(message: ErrorMessage.invalidURL)
//        }
//        URLSession.shared.dataTask(with: serviceURL) { (data, response
//            , error) in
//            if let error = error {
//                completion(nil,ServiceError.connectionError(message: ErrorMessage.connectionError + error.localizedDescription))
//            }
//            guard let data = data else {
//                completion(nil,ServiceError.connectionError(message: ErrorMessage.invalidResponse))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                guard let str = String(data: data, encoding: String.Encoding.isoLatin1) else {return}
//                guard let properData = str.data(using: .utf8,allowLossyConversion: true) else {return}
//                countryData = try decoder.decode(CountryInfo.self, from: properData)
//            } catch let err {
//                completion(nil,ServiceError.jsonParsingError(message: ErrorMessage.invalidJson + err.localizedDescription))
//            }
//            DispatchQueue.main.async {
//                completion(countryData, nil)
//            }
//        }.resume()
//    }
}
