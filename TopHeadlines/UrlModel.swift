//
//  URLModel.swift
//  TopHeadlines
//
//  Created by Naresh Sir on 25/05/20.
//  Copyright © 2020 Shiva Ganesh. All rights reserved.
//

import Foundation

class URLModel : NSObject{
    static let baseUrl = "https://newsapi.org/v2/top-headlines?country="
    static let country = "in"
    static let apiKey = "30b9bb0e5e4746ec95647f04e4882b46"
    static let getUrl = "\(baseUrl)\(country)&apiKey=\(apiKey)"
}
