//
//  NewsModel.swift
//  DRC_Practical_Test
//
//  Created by Chetan Desai on 02/11/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import Foundation

struct newsModel : Codable {
    let status : String?
    let totalResults : Int?
    let articles : [articlesModel]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        articles = try values.decode([articlesModel].self, forKey: .articles)
    }
}

struct articlesModel : Codable {
    let title : String?
    let description : String?
    let urlToImage : String?
    let author : String?
    let url : String?
    let publishedAt : String?
    let content : String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case urlToImage = "urlToImage"
        case author = "author"
        case url = "url"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
    
}
