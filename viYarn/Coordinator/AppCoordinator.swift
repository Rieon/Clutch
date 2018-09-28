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
        let mainScreenController = MainScreenTableViewController(didTapCategory: stoyScreenSelected)
        navController = UINavigationController(rootViewController: mainScreenController)
        navController?.setNavigationBarHidden(false, animated: true)
        window.rootViewController = navController
    }
    
    func stoyScreenSelected(category: Category) -> Void {
        let storyController = StoryViewController(category: category, didTapEpisode: episodeScreenSelected)
        navController?.setNavigationBarHidden(false, animated: true)
        navController?.pushViewController(storyController, animated: true)
    }
    func failLoad(error: Error) -> Void {
    }
    
    func episodeScreenSelected(id: Int) {
        navController?.setNavigationBarHidden(false, animated: true)
        navController?.pushViewController(EpisodeViewController(loadStoryID: id, didTapEpisode: chatScreenSelected), animated: true)
    }
    func chatScreenSelected(content: [ChatElement], descriptionEpisode: String){
        navController?.setNavigationBarHidden(false, animated: true)
        navController?.pushViewController(ChatTableViewController(loadedEpisodeContent: content, descriptionEpisode: descriptionEpisode), animated: true)
    }
}


