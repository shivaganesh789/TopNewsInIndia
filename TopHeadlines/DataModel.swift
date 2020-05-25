//
//  NetworkManager.swift
//  TopHeadlines
//
//  Created by Naresh Sir on 25/05/20.
//  Copyright © 2020 Shiva Ganesh. All rights reserved.
//

import Foundation

// MARK: - TopNewsModel
struct TopNews: Codable {
    
    let totalResults: Int?
    let status: String?
    let articles: [NewsData]?
    
}

// MARK: - NewsData
struct NewsData: Codable {
    
    let source: Source
    let author: String?
    let title:String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case articleDescription = "description"
        case url
        case urlToImage
        case publishedAt
        case content  
    }
}

struct Source: Codable {
    let id: String?
    let name: String?
}

typealias GetTopNewsModel = TopNews
