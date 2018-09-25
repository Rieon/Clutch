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
    let chatMessages: [(author: String, messages: [String])]
    let episodeDescription:String
}

extension EpisodeContent {
    init? (html: String) {
        guard let doc: Document = try? SwiftSoup.parse(html) else { return nil }
        guard let elements = try? doc.getAllElements() else { return nil }
        
        guard let episodeDescriptionElement = try? doc.select("p").first() else { return nil }
        guard let elementDesc = episodeDescriptionElement else { return nil }
        guard let episodeDescription  = try? elementDesc.text() else { return nil }
        
    
        var arrMessages = [(author: String, messages: [String])]()
        var currentAuthorMessages = [String]()
        for element in elements {
            
            switch element.tagName() {
            case "b":
                guard let nameAuthor = try? element.text() else { return nil }
                if let last =  arrMessages.last {
                    if nameAuthor != last.author{
                        arrMessages.append((nameAuthor, []))
                        currentAuthorMessages.removeAll()
                    }
                } else{
                    arrMessages.append((nameAuthor, []))
                }
            case "span":
                guard let message = try? element.text() else { return nil }
                currentAuthorMessages.append(message)
                arrMessages[arrMessages.count - 1].messages = currentAuthorMessages
            default:
                continue
                
            }
        }
        self.init(chatMessages: arrMessages, episodeDescription: episodeDescription)
    }
    
    
}
