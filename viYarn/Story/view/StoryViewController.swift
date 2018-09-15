//
//  StoryViewController.swift
//  viYarn
//
//  Created by vieon on 14.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class StoryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    lazy var cellLayoutHeight:CGFloat = {
        return self.view.bounds.height * 0.7
    }()
    lazy var cellLayoutWidth:CGFloat = {
        return self.view.bounds.width * 0.9
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = colorBackground
        collectionView?.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.cellID)
        collectionView?.contentInset.top = (self.view.bounds.height - cellLayoutHeight) / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellLayoutWidth, height: cellLayoutHeight)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.cellID, for: indexPath as IndexPath) as? StoryCollectionViewCell {
            return cell.configured()
        }
        return UICollectionViewCell()
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellHeight = cellLayoutHeight + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.y + scrollView.contentInset.top) / cellHeight
        let rounded = round(index)
        
        targetContentOffset.pointee = CGPoint(x: scrollView.contentInset.left, y: rounded * cellHeight - scrollView.contentInset.top)
    }

}


