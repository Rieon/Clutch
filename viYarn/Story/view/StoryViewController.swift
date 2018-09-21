//
//  StoryViewController.swift
//  viYarn
//
//  Created by vieon on 14.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class StoryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let didTapEpisode: () -> Void
    
    init(didTapEpisode: @escaping () -> Void, layout: UICollectionViewLayout) {
        self.didTapEpisode = didTapEpisode
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    private var cellLayoutHeight: CGFloat {
        return view.bounds.height * 0.7
    }
    private var cellLayoutWidth: CGFloat {
        return view.bounds.width * 0.9
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = colorBackground
        collectionView?.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.cellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellLayoutWidth, height: cellLayoutHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.cellID, for: indexPath as IndexPath) as? StoryCollectionViewCell {
            cell.btnShowEpisode.addTarget(self, action: #selector(selectEpisodes), for: .touchUpInside)
            return cell.configured()
        }
        return UICollectionViewCell()
    }
    
    func selectEpisodes() {
        didTapEpisode()
    }
}


