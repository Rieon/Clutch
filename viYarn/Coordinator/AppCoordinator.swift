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
        let storyViewModel = MockStoryViewModel(didTapEpisode: { [unowned self] in self.episodeScreenSelected() })
        let storyController = StoryViewController(viewModel: storyViewModel)
        navController = UINavigationController(rootViewController: storyController)
        window.rootViewController = navController
    }
    
    func episodeScreenSelected() {
        let viewModel = MockEpisodeViewModel(networkProvider: EpisodeNetworkProvider())
        navController?.setNavigationBarHidden(false, animated: true)
        navController?.pushViewController(EpisodeViewController(viewModel: viewModel), animated: true)
    }
}


