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
    let chatMessages: [(author: String, messages: [ChatElement])]
    let episodeDescription:String
}
struct ChatElement {
    let message: String
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
        
    
        var arrMessages = [(author: String, messages: [ChatElement])]()
        for element in elements {
            
            switch element.tagName() {
            case "b":
                guard let nameAuthor = try? element.text() else { return nil }
                if let last =  arrMessages.last {
                    if nameAuthor != last.author{
                        arrMessages.append((nameAuthor, []))
                    }
                } else{
                    arrMessages.append((nameAuthor, []))
                }
            case "span":
                guard let message = try? element.text() else { return nil }
                let chatElement = ChatElement(message: message, tag: element.tagName(), cellID: ChatTableViewCellMessage.cellID)
                arrMessages[arrMessages.count - 1].messages.append(chatElement)
            case "img":
                guard let elemImage = try? element.select("img[src]") else { return nil }
                guard let message = try? elemImage.attr("src") else { return nil }
                let chatElement = ChatElement(message: message, tag: element.tagName(), cellID: ChatTableViewCellImage.cellID)
                arrMessages[arrMessages.count - 1].messages.append(chatElement)

            default:
                continue
                
            }
        }
        self.init(chatMessages: arrMessages, episodeDescription: episodeDescription)
    }
    
    
}
