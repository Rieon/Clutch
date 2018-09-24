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
    case getStory = "core.get_category_posts"
}
enum ParsingError: Error {
    case wrongData
}
class APIClient {
  
    let host = "http://ec2-54-234-103-230.compute-1.amazonaws.com"
    static let instance = APIClient()
    
    func request(forID: Int, typeRequest:APIClientTypeRequest, typePost:APIClientPostType, success: @escaping ([String: Any]) -> Void, failure: @escaping (Error) -> Void) {
        let url = host
        
        let keyPost = typePost == .episode ? "post_parent" : "id"
        
        let parameters: Parameters = [
            "json": typeRequest.rawValue,
            keyPost: "\(forID)",
            "post_type": typePost.rawValue,
            "dev": "1" ]
        Alamofire.request(url, parameters: parameters).responseJSON { (response) in
            
            if let error = response.error {
                failure(error)
            } else {
                guard let data = response.result.value else {
                    failure(ParsingError.wrongData)
                    return
                }
                guard let json = data as? [String: Any] else {
                    failure(ParsingError.wrongData)
                    return
                }
                success(json)
            }
        }
    }
    
    
    
}
