//
//  EpisodesViewModelResponsibilities.swift
//  viYarn
//
//  Created by vieon on 21.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import UIKit

protocol EpisodeLoaderDelagate: class{
    func didLoadEpisodes()
    func failLoadEpisodes()
}

protocol EpisodesViewModelResponsibilities: UITableViewDataSource, UITableViewDelegate {
    var delegate: EpisodeLoaderDelagate? {get set}
    func loadEpisode()
}


class MockEpisodeViewModel: NSObject, EpisodesViewModelResponsibilities {
    weak var delegate: EpisodeLoaderDelagate?
    
    var episodes = [Episode]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.cellID) as? EpisodeTableViewCell {
            return cell.configured(for: indexPath.row, with: episodes[indexPath.row])
        }
        
        return UITableViewCell()
    }
    
    func loadEpisode() {
        self.episodes = [
            Episode(title: "title", description: "Elephant"),
            Episode(title: "title2", description: "Elephant")
        ]
        delegate?.didLoadEpisodes()
    }

}

