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
    func loadEpisode(storyID: Int, didLoad: @escaping () -> Void, failLoad: @escaping (Error) -> Void)
}


class MockEpisodeViewModel: NSObject, EpisodesViewModelResponsibilities {
    var episodes = [Episode]()
    let loadStoryID: Int
    let didTapEpisode: () -> Void
    
    init(loadStoryID: Int, didTapEpisode: @escaping () -> Void){
        self.loadStoryID = loadStoryID
        self.didTapEpisode = didTapEpisode
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.cellID) as? EpisodeTableViewCell {
            let postEpisode = episodes[indexPath.row]
            return cell.configured(for: indexPath.row, with: postEpisode, didTapEpisode: didTapEpisode)
        }    
        return UITableViewCell()
    }
    
    func loadEpisode(storyID: Int, didLoad: @escaping () -> Void, failLoad: @escaping (Error) -> Void) {
        APIClient.instance.request(forID: self.loadStoryID, typeRequest: .getPost, typePost: .episode, success: { [unowned self] (loadedEpisode) in
            
            guard let postsJson = loadedEpisode["posts"] as? [[String : Any]] else {
                failLoad(ParsingError.wrongData)
                return
            }
            var postsArr = [Episode]()
            for postJson in postsJson {
                guard let post = Episode(json: postJson) else { return }
                postsArr.append(post)
            }
            self.episodes = postsArr
            didLoad()
        }) { (error) in
            failLoad(error)
        }
    }

}

