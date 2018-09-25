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
        var episodeDescription = ""
        if let elementDesc = episodeDescriptionElement {
            if let descText = try? elementDesc.text(){
                episodeDescription = descText
            }
        }
        
        var currentAuthor: String = ""
        var arrMessages = [(String, [String])]()
        var currentAuthorMessages = [String]()
        for element in elements {

            if element.tagName() == "b"{
                guard let nameAuthor = try? element.text() else { return nil }
                if currentAuthor.count == 0 {
                    currentAuthor = nameAuthor
                    continue
                }
                
                if nameAuthor != currentAuthor {
                    arrMessages.append((currentAuthor, currentAuthorMessages))
                    currentAuthorMessages.removeAll()
                }
                currentAuthor = nameAuthor
                continue
            }
            
            if element.tagName() == "span" {
                guard let message = try? element.text() else { return nil }
                currentAuthorMessages.append(message)
            }
        }
        self.init(chatMessages: arrMessages, episodeDescription: episodeDescription)
    }
}
