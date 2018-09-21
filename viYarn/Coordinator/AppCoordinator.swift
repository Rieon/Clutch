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
        let layout = UICollectionViewFlowLayout()
        let storyController = StoryViewController(didTapEpisode: { [unowned self] in self.episodeScreenSelected() }, layout: layout)
        navController = UINavigationController(rootViewController: storyController)
        window.rootViewController = navController
    }
    
    func episodeScreenSelected() {
        let viewModel = MockEpisodeViewModel()
        navController?.pushViewController(EpisodeViewController(viewModel: viewModel), animated: true)
    }
}


