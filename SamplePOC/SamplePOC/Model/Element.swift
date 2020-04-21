//
//  Element.swift
//  SamplePOC
//
//  Created by Jaya on 20/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import UIKit
struct CountryInfo: Codable {
    var title: String
    var rows: [Element]
}
struct Element: Codable {
    var title : String?
    var imageHref : String?
    var description : String?
}
