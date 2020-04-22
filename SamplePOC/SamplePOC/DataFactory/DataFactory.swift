//
//  DataFactory.swift
//  SamplePOC
//
//  Created by Jaya on 21/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import UIKit

class DataFactory: NSObject {
    static let shared = DataFactory()
    func getCountryData(completion: @escaping (CountryInfo?, Error?) -> Void) {
        var countryData: CountryInfo?
        do {
            try NetworkManager.sharedInstance.getData(urlString: kCountryDataServiceURLString) { (data, error) in
                do {
                    guard let responseData = data else {
                        print(ServiceError.connectionError(message: ErrorMessage.invalidResponse + (error?.localizedDescription ?? kEmptyString)))
                        return
                    }
                    let decoder = JSONDecoder()
                    guard let str = String(data: responseData, encoding: String.Encoding.isoLatin1) else {return}
                    guard let properData = str.data(using: .utf8, allowLossyConversion: true) else {return}
                    countryData = try decoder.decode(CountryInfo.self, from: properData)
                } catch let err {
                    completion(nil, ServiceError.jsonParsingError(message: ErrorMessage.invalidJson + err.localizedDescription))
                }
                completion(countryData, nil)
            }
        } catch {
            print(ServiceError.connectionError(message: ErrorMessage.connectionError + " " + error.localizedDescription))
        }
        
    }
}

extension UIImageView {
    public func imageFromServerURL(urlString: String?) {
        self.image = nil
        do {
            try  NetworkManager.sharedInstance.getData(urlString: urlString ) { (imageData, error) in
                guard let responseData = imageData else {
                    print(ServiceError.connectionError(message: ErrorMessage.invalidResponse + (error?.localizedDescription ?? kEmptyString)))
                    return
                }
                let image = UIImage(data: responseData)
                self.image = image
            }
        } catch {
            print(ServiceError.connectionError(message: ErrorMessage.connectionError + " " + error.localizedDescription))
        }
    }
}
