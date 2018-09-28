//
//  Story.swift
//  viYarn
//
//  Created by vieon on 21.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import SwiftSoup

struct Story {
    
    let id: Int
    let title: String
    let content: String
    let date: String
    let urlImage: String
    
}

extension Story{
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int else { return nil }
        guard let title = json["title"] as? String else { return nil }
        guard let contentHtml = json["content"] as? String else { return nil }
        
        guard let doc: Document = try? SwiftSoup.parse(contentHtml) else { return nil }
        guard let content = try? doc.select("p").first()?.text() else { return nil }
        
        guard let date = json["date"] as? String else { return nil }
        var urlImage = ""
        if let jsonImages = json["thumbnail_images"] as? [String: Any] {
            if let jsonImageMedium = jsonImages["full"] as? [String: Any] {
                urlImage = jsonImageMedium["url"] as? String ?? ""
            }
        }
        self.init(id: id, title: title, content: content ?? "", date: date, urlImage: urlImage)
        
    }
}
