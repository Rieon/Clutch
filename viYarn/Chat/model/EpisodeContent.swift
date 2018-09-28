//
//  Chat.swift
//  viYarn
//
//  Created by vieon on 25.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import SwiftSoup

struct EpisodeContent {
    let chatMessages: [ChatElement]
    let episodeDescription: String
}
struct ChatElement {
    let author: String
    let message: String
    let isAuthor: Bool
    let type: String
    
}

extension EpisodeContent {
    init? (arrJson: [[String: Any]]) {
        // temp: first send message become 'Author'
        var tempAuthor = ""
        var messages = [ChatElement]()
        for json in arrJson {
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
        self.init(chatMessages: messages, episodeDescription: "")
    }
    
    
}
