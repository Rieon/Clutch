//
//  Episode.swift
//  viYarn
//
//  Created by vieon on 21.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation


struct Episode {
    let posts: [EpisodePost]
}
extension Episode {
    
    init?(json: [String: Any]) {
        guard let postsJson = json["posts"] as? [[String : Any]] else { return nil }
        var postsArr = [EpisodePost]()
        for postJson in postsJson {
            guard let post = EpisodePost(json: postJson) else { return nil }
            postsArr.append(post)
        }
        
        self.init(posts: postsArr)
        
        
    }
    
}
