//
//  EpisodesViewModelResponsibilities.swift
//  viYarn
//
//  Created by vieon on 21.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol EpisodesViewModelResponsibilities: UITableViewDataSource, UITableViewDelegate {
    func loadEpisode(storyID: Int, didLoad: @escaping () -> Void, failLoad: @escaping () -> Void)
}


class MockEpisodeViewModel: NSObject, EpisodesViewModelResponsibilities {
    var episodes: Episode?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = episodes?.posts.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.cellID) as? EpisodeTableViewCell {
            guard let postEpisode = episodes?.posts[indexPath.row] else { return UITableViewCell() }
            return cell.configured(for: indexPath.row, with: postEpisode)
        }
        
        return UITableViewCell()
    }
    
    func loadEpisode(storyID: Int, didLoad: @escaping () -> Void, failLoad: @escaping () -> Void) {
        APIClient.instance.request(forID: storyID, typeRequest: .getPost, typePost: .episode, success: { [unowned self] (loadedEpisode) in
            guard let loadedEpisode = Episode(json: loadedEpisode) else {
                failLoad()
                return
            }
            self.episodes = loadedEpisode
            didLoad()
        }) {
            failLoad()
        }
    }

}

