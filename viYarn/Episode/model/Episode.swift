//
//  EpisodePost.swift
//  viYarn
//
//  Created by vieon on 22.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import SwiftSoup

struct Episode {
    let id: Int
    let type: String
    let status: String
    let title: String
    let description: String
    let messages: [ChatElement]
    let author: Author
}

struct ChatElement {
    let author: String
    let message: String
    let isAuthor: Bool
    let type: String
    
}

extension Episode {
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int else { return nil }
        guard let type = json["type"] as? String else { return nil }
        guard let status = json["status"] as? String else { return nil }
        guard let title = json["title"] as? String else { return nil }
        guard let description = json["post_excerpt"] as? String else { return nil }
        guard let contentMessages = json["messages"] as? [[String: Any]] else { return nil }
        
        // temp: first send message become 'Author'
        var tempAuthor = ""
        var messages = [ChatElement]()
        for json in contentMessages {
            guard let author = json["author"] as? String else { return nil }
            if tempAuthor.count == 0 {
                tempAuthor = author
            }
            guard let type = json["type"] as? String else { return nil }
            var message = ""
            switch type {
            case "text":
                guard let text = json["message"] as? String else { return nil }
                message = text
            case "image":
                guard let src = json["src"] as? String else { return nil }
                message = src
            default:
                return nil
            }
            let isAuthor = tempAuthor == author
            messages.append(ChatElement(author: author, message: message, isAuthor: isAuthor, type: type))
        }
        
        guard let jsonAuthor = json["author"] as? [String: Any] else { return nil }
        guard let author = Author(json: jsonAuthor) else { return nil }
        
        self.init(id: id, type: type, status: status, title: title, description: description, messages: messages, author: author)
    }
    
    
}
