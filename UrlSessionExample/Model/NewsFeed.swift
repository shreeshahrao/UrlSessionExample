//
//  NewsFeed.swift
//  UrlSessionExample
//
//  Created by Shreesha Rao on 01/01/22.
//

import Foundation

struct News: Codable {
    
    var news:[NewsFeed]
}

struct NewsFeed: Codable {
    
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Articles]?
}
