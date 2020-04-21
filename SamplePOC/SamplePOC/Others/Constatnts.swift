//
//  Constatnts.swift
//  SamplePOC
//
//  Created by Jaya on 20/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import Foundation
// MARK:- Service String Constants
let kResourceName = "response"
let kResourceExt = "json"
let kEmpty = ""

// MARK:- UI Integer Constants
let kMinimumRowHeight = 100.0

// MARK:- UI String Constants
let kCellIdentifier = "mainTableCellIdentifier"
let kIntialiserError = "init(coder:) has not been implemented"
let kEmptyString = ""

// MARK:- Service  Constant
let kCountryDataServiceURLString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

enum ServiceError: Error {
    case invalidURL(message: String)
    case connectionError(message: String)
    case jsonParsingError(message: String)
    case invalidResponse(message: String)
}

struct ErrorMessage {
    static let invalidURLString = "URL is not valid. May be it is empty"
    static let invalidURL = "URL is not valid. Ensure url is proper before start service request"
    static let connectionError = "There is a problem connecting to server"
    static let invalidResponse = "Data is invalid"
    static let invalidJson = "JSON is invalid"
}


