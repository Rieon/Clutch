//
//  Story.swift
//  viYarn
//
//  Created by vieon on 21.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation

struct Story {
    
    let id: Int
    let title: String
    let content: String
    let date: String
    let urlImageMedium: String
    let postContent: String
    
}

extension Story{
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int else { return nil }
        guard let title = json["title"] as? String else { return nil }
        guard let content = json["content"] as? String else { return nil }
        guard let date = json["date"] as? String else { return nil }
        var urlImageMedium = ""
        if let jsonImages = json["thumbnail_images"] as? [String: Any] {
            if let jsonImageMedium = jsonImages["medium_large"] as? [String: Any] {
                urlImageMedium = jsonImageMedium["url"] as? String ?? ""
            }
        }
        guard let postContent = json["post_content"] as? String else { return nil }
        self.init(id: id, title: title, content: content, date: date, urlImageMedium: urlImageMedium, postContent: postContent)
        
    }
}
