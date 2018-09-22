//
//  EpisodePost.swift
//  viYarn
//
//  Created by vieon on 22.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation

struct EpisodePost {
    let id: Int
    let type: String
    let status: String
    let title: String
    let content: String
//    let author: Author
}

extension EpisodePost {
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int else { return nil}
        guard let type = json["type"] as? String else { return nil}
        guard let status = json["status"] as? String else { return nil}
        guard let title = json["title"] as? String else { return nil}
        guard let content = json["content"] as? String else { return nil}
        
        self.init(id: id, type: type, status: status, title: title, content: content)
    }
}
