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
    let tag: String
    let cellID: String
    
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
                chatMessages.append(ChatElement(author: lastAuthorName, message: message, isAuthor: tempAuthor == lastAuthorName,  tag: tagName, cellID: ChatTableViewCellMessage.cellID))
            case "img":
                guard let elemImage = try? element.select("img[src]") else { return nil }
                guard let message = try? elemImage.attr("src") else { return nil }
                chatMessages.append(ChatElement(author: lastAuthorName, message: message, isAuthor: tempAuthor == lastAuthorName, tag: tagName, cellID: ChatTableViewCellImage.cellID))

            default:
                continue
            }
        }
        print(chatMessages.count)
        
        self.init(chatMessages: chatMessages, episodeDescription: episodeDescription)
    }
    
    
}
