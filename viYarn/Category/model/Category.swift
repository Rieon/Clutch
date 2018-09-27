//
//  StoryCategory.swift
//  viYarn
//
//  Created by vieon on 27.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation

struct Category {
    let id: Int
    let name: String
}

extension Category {
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int else { return nil }
        guard let name = json["title"] as? String else { return nil }
        
        self.init(id: id, name: name)
    }
}
