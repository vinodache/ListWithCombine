//
//  NewsItem.swift
//  ListWithCombine
//
//  Created by Vinod Achuthankutty on 21/1/23.
//

import Foundation

struct NewsItemParent: Codable {
    let category: String
    let data: [NewsItem]
    let success: Bool
}

struct NewsItem: Codable {
    var author: String
    var content: String
    var date: String
    var id: String
    var imageUrl: String?
    var readMoreUrl: String?
    var time: String
    var title: String
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case author, content, date, id, imageUrl, readMoreUrl, time, title, url
    }
    init(author: String, content: String, date: String, id: String, imageUrl: String?, readMoreUrl: String?, time: String, title: String, url: String) {
        self.author = author
        self.content = content
        self.date = date
        self.id = id
        self.imageUrl = imageUrl
        self.readMoreUrl = readMoreUrl
        self.time = time
        self.title = title
        self.url = url
    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        author = try container.decode(String.self, forKey: .author)
//        content = try container.decode(String.self, forKey: .content)
//        date = try container.decode(String.self, forKey: .date)
//        id = try container.decode(String.self, forKey: .id)
//        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
//        readMoreUrl = try container.decodeIfPresent(String.self, forKey: .readMoreUrl)
//        time = try container.decode(String.self, forKey: .time)
//        title = try container.decode(String.self, forKey: .title)
//        url = try container.decode(String.self, forKey: .url)
//    }
    
    func copy() -> NewsItem {
        return NewsItem(author: self.author, content: self.content, date: self.date, id: self.id, imageUrl: self.imageUrl,
                        readMoreUrl: self.readMoreUrl,
                        time: self.time,
                        title: self.title,
                        url: self.url)
    }
}
