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
    let content: EpisodeContent
    let author: Author
}

extension Episode {
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int else { return nil }
        guard let type = json["type"] as? String else { return nil }
        guard let status = json["status"] as? String else { return nil }
        guard let title = json["title"] as? String else { return nil }
        guard let contentMessages = json["messages"] as? [[String: Any]] else { return nil }
        guard let content = EpisodeContent(arrJson: contentMessages) else { return nil }
        guard let jsonAuthor = json["author"] as? [String: Any] else { return nil }
        guard let author = Author(json: jsonAuthor) else { return nil }
        
        self.init(id: id, type: type, status: status, title: title, content: content, author: author)
    }
    
    
}
