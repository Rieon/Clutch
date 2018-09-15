//
//  StoryViewController.swift
//  viYarn
//
//  Created by vieon on 14.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class StoryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellID = "CellId"
    var storyCollectionView: UICollectionView!
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = colorBackground
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let cellWidth: CGFloat = screenSize.width * 0.9
        let cellHeight: CGFloat = screenSize.height * 0.7
        return CGSize(width: cellWidth, height: cellHeight)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }

}

