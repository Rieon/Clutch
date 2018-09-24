//
//  Author.swift
//  viYarn
//
//  Created by vieon on 22.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation

struct Author {
    let id: Int
    let slug: String
    let lastName: String
    let firstName: String
    let name: String
    let nickname: String
    let url: String
    let description: String
}

extension Author {
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int else { return nil }
        guard let slug = json["slug"] as? String else { return nil }
        guard let lastName = json["last_name"] as? String else { return nil }
        guard let firstName = json["first_name"] as? String else { return nil }
        guard let name = json["name"] as? String else { return nil }
        guard let nickname = json["nickname"] as? String else { return nil }
        guard let url = json["url"] as? String else { return nil }
        guard let description = json["description"] as? String else { return nil }
        
        self.init(id: id, slug: slug, lastName: lastName, firstName: firstName, name: name, nickname: nickname, url: url, description: description)
    }
}
