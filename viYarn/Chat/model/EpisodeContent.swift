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
    init? (html: String) {
        guard let doc: Document = try? SwiftSoup.parse(html) else { return nil }
        guard let elements = try? doc.getAllElements() else { return nil }
        
        guard let episodeDescriptionElement = try? doc.select("p").first() else { return nil }
        guard let elementDesc = episodeDescriptionElement else { return nil }
        guard let episodeDescription  = try? elementDesc.text() else { return nil }
        
        var tempAuthor = "[Nicole]"
        
        var chatMessages = [ChatElement]()
        var lastAuthorName: String = ""
        for element in elements {
            let tagName = element.tagName()
            switch tagName {
            case "b":
                guard let author = try? element.text() else { return nil }
                if author.count > 0 {
                    lastAuthorName = author
                }
            case "span":
                guard let message = try? element.text() else { return nil }
                chatMessages.append(ChatElement(author: lastAuthorName, message: message, isAuthor: tempAuthor == lastAuthorName,  type: tagName))
            case "img":
                guard let elemImage = try? element.select("img[src]") else { return nil }
                guard let message = try? elemImage.attr("src") else { return nil }
                chatMessages.append(ChatElement(author: lastAuthorName, message: message, isAuthor: tempAuthor == lastAuthorName, type: tagName))

            default:
                continue
            }
        }
        print(chatMessages.count)
        
        self.init(chatMessages: chatMessages, episodeDescription: episodeDescription)
    }
    init? (arrJson: [[String: Any]]) {
        // temp: first send message become 'Author'
        var tempAuthor = ""
        var messages = [ChatElement]()
        for json in arrJson {
            guard let author = json["author"] as? String else { return nil }
            if tempAuthor.count == 0{
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
