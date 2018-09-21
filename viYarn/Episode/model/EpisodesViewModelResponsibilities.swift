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
    func didLoad()
    func didFail()
}

class EpisodesViewModelResponsibilities: NSObject, UITableViewDataSource, UITableViewDelegate {
    var episodes: [Episode] = []
    var delegate: EpisodeLoaderDelagate?
    func loadEpisode(){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.cellID) as? EpisodeTableViewCell {
            return cell.configured(for: indexPath.row, with: self.episodes[indexPath.row])
        }
        
        return UITableViewCell()
    }
}

class MockEpisodeViewModel:EpisodesViewModelResponsibilities {
    
    override func loadEpisode() {
        self.episodes = [
            Episode(title: "title", description: "Elephant"),
            Episode(title: "title2", description: "Elephant")
        ]
        self.delegate?.didLoad()
    }
}
