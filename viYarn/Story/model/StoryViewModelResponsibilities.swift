//
//  StoryViewModelResponsibilities.swift
//  viYarn
//
//  Created by vieon on 21.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation

//
//  EpisodesViewModelResponsibilities.swift
//  viYarn
//
//  Created by vieon on 21.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import UIKit

protocol StoryLoaderDelagate: class{
    func didLoadStory()
    func failLoadStory()
}

protocol StoryViewModelResponsibilities: UICollectionViewDelegate, UICollectionViewDataSource {
    var delegate: StoryLoaderDelagate? {get set}
    func loadStory()
}


class MockStoryViewModel: NSObject, StoryViewModelResponsibilities {
    weak var delegate: StoryLoaderDelagate?
    var stories = [Story]()
    
    let didTapEpisode: () -> Void
    
    init(didTapEpisode: @escaping () -> Void) {
        self.didTapEpisode = didTapEpisode
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.cellID,
                                                         for: indexPath as IndexPath) as? StoryCollectionViewCell {
            return cell.configured(with: { [unowned self] in self.didTapEpisode() })
        }
        return UICollectionViewCell()
    }
    
    func loadStory() {
        self.stories = [
            Story(title: "Story", description: "eplh", viewsCount: "view 11", datePublish: Date(timeIntervalSince1970: Date().timeIntervalSince1970))
        ]
        delegate?.didLoadStory()
    }

    
}

