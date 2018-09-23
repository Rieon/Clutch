//
//  APIClient.swift
//  viYarn
//
//  Created by vieon on 23.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import Alamofire

enum APIClientPostType: String {
    case episode = "clutch_episode"
    case story = "clutch_story"
}
enum APIClientTypeRequest: String {
    case getPost = "core.get_posts"
}
struct APIClient {
    
    let host = "http://ec2-54-234-103-230.compute-1.amazonaws.com"
    static let instance = APIClient()
    
    func request(forID: Int, typeRequest:APIClientTypeRequest, typePost:APIClientPostType, success: @escaping ([String: Any]) -> Void, failure: @escaping () -> Void) {
        let url = host
        
        let parameters: Parameters = [
            "json": typeRequest.rawValue,
            "post_parent": "\(forID)",
            "post_type": typePost.rawValue,
            "dev": "1" ]
        Alamofire.request(url, parameters: parameters).responseJSON { (response) in
            
            if response.error != nil {
                failure()
            } else {
                guard let data = response.result.value else {
                    failure()
                    return
                }
                guard let json = data as? [String: Any] else {
                    failure()
                    return
                }
                success(json)
            }
        }
    }
    
    
    
}
