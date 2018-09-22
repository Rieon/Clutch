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

protocol EpisodeLoaderDelagate: class{
    func didLoadEpisodes()
    func failLoadEpisodes()
}

protocol EpisodesViewModelResponsibilities: UITableViewDataSource, UITableViewDelegate {
    var delegate: EpisodeLoaderDelagate? {get set}
    func loadEpisode(storyID: Int)
}


class MockEpisodeViewModel: NSObject, EpisodesViewModelResponsibilities {
    weak var delegate: EpisodeLoaderDelagate?
    private let networkProvider: EpisodeNetworkProvider
    let host = "http://ec2-54-234-103-230.compute-1.amazonaws.com"
    var episodes: Episode?
    
    init(networkProvider: EpisodeNetworkProvider) {
        self.networkProvider = networkProvider
    }
    
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
    
    func loadEpisode(storyID: Int) {
        networkProvider.episodes(withHost: host, storyID: storyID, success: { [unowned self] (loadedEpisodes) in
            if loadedEpisodes.isParsedSuccessfully {
            }
            self.episodes = loadedEpisodes
            self.delegate?.didLoadEpisodes()
        }) { () in
            self.delegate?.failLoadEpisodes()
        }
    }

}

class EpisodeNetworkProvider {
    var currentRequest: DataRequest?
    
    func episodes(withHost host: String, storyID: Int, success: @escaping (Episode) -> Void, failure: @escaping () -> Void) {
        let url = host
        
        let parameters: Parameters = [
            "json": "core.get_posts",
            "post_parent": "\(storyID)",
            "post_type": "clutch_episode",
            "dev": "1" ]
        currentRequest = Alamofire.request(url, parameters: parameters).responseString { (response) in
            
            if response.error != nil {
                failure()
            } else {
                guard let data = response.result.value?.data(using: .utf8) else {
                    failure()
                    return
                }
                do {
                    let serializedData = try JSONSerialization.jsonObject(with: data, options : .allowFragments)
                    guard let json = serializedData as? [String: Any] else {
                        failure()
                        return
                    }
                    guard let episode = Episode(json: json) else {
                        failure()
                        return
                    }
                    success(episode)
                } catch {
                    failure()
                }
            }
        }
    }
}

