//
//  Articles.swift
//  UrlSessionExample
//
//  Created by Shreesha Rao on 01/01/22.
//

import Foundation

struct Articles: Codable {
    
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var content: String?
}
