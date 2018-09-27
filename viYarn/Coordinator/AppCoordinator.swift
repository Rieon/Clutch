//
//  AppCoordinator.swift
//  viYarn
//
//  Created by Ivan Melnichuk on 9/21/18.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: NSObject {
    
    let window: UIWindow
    var navController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
    func initFlow() {
        let simpleViewController = UIViewController()
        navController = UINavigationController(rootViewController: simpleViewController)
        navController?.setNavigationBarHidden(false, animated: true)
        window.rootViewController = navController
        loadCategories(didLoad: loadedCategories, failLoad: failLoad)
    }
    func loadCategories(didLoad: @escaping([Category]) -> Void, failLoad: @escaping(Error) -> Void) {
        APIClient.instance.request(typeRequest: .getCategories, success: {(loadCategories) in
            guard let postsJson = loadCategories["categories"] as? [[String : Any]] else {
                return failLoad(ParsingError.wrongData)
            }
            var postsArr = [Category]()
            for postJson in postsJson {
                guard let post = Category(json: postJson) else { return }
                postsArr.append(post)
            }
            didLoad(postsArr)
        }) { (error) in
            failLoad(error)
        }
        
    }
    func loadedCategories(categories: [Category]) -> Void {
        let storyController = StoryViewController(category: categories[1], didTapEpisode: episodeScreenSelected)
        navController?.setNavigationBarHidden(false, animated: true)
        navController?.pushViewController(storyController, animated: true)
    }
    func failLoad(error: Error) -> Void {
    }
    
    func episodeScreenSelected(id: Int) {
        navController?.setNavigationBarHidden(false, animated: true)
        navController?.pushViewController(EpisodeViewController(loadStoryID: id, didTapEpisode: chatScreenSelected), animated: true)
    }
    func chatScreenSelected(content: EpisodeContent){
        navController?.setNavigationBarHidden(false, animated: true)
        navController?.pushViewController(ChatTableViewController(loadedEpisodeContent: content), animated: true)
    }
}


