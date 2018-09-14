//
//  StoryViewController.swift
//  viYarn
//
//  Created by vieon on 14.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    let cellID = "CellId"
    var storyCollectionView: UICollectionView!
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    let screenSize = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()

        let cellWidth: CGFloat = screenSize.width * 0.9
        let cellHeight: CGFloat = screenSize.height * 0.7
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        storyCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        storyCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        storyCollectionView.backgroundColor = colorBackground
        storyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(storyCollectionView)
        
        storyCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        storyCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        storyCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        storyCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }

}
