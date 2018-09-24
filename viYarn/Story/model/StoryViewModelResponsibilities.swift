//
//  EpisodesViewModelResponsibilities.swift
//  viYarn
//
//  Created by vieon on 21.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import UIKit

protocol StoryViewModelResponsibilities: UICollectionViewDelegate, UICollectionViewDataSource {
    func loadEpisode(categoryID: Int, didLoad: @escaping () -> Void, failLoad: @escaping (Error) -> Void)
}


class MockStoryViewModel: NSObject, StoryViewModelResponsibilities {
    var stories = [Story]()
    
    let didTapEpisode: (Int) -> Void
    
    init(didTapEpisode: @escaping (Int) -> Void) {
        self.didTapEpisode = didTapEpisode
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.cellID,
                                                         for: indexPath as IndexPath) as? StoryCollectionViewCell {
            return cell.configured(story: stories[indexPath.row], with: self.didTapEpisode)
        }
        return UICollectionViewCell()
    }
    
    func loadEpisode(categoryID: Int, didLoad: @escaping () -> Void, failLoad: @escaping (Error) -> Void) {
        APIClient.instance.request(forID: categoryID, typeRequest: .getStory, typePost: .story, success: { [unowned self] (loadedStory) in
            
            guard let postsJson = loadedStory["posts"] as? [[String : Any]] else {
                failLoad(ParsingError.wrongData)
                return
            }
            var postsArr = [Story]()
            for postJson in postsJson {
                guard let post = Story(json: postJson) else { return }
                postsArr.append(post)
            }
            self.stories = postsArr
            didLoad()
        }) { (error) in
            failLoad(error)
        }
    }

    
}

