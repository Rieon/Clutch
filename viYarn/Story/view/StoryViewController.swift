//
//  StoryViewController.swift
//  viYarn
//
//  Created by vieon on 14.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, StoryLoaderDelagate {
    
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    private var cellLayoutHeight: CGFloat {
        return view.bounds.height * 0.7
    }
    private var cellLayoutWidth: CGFloat {
        return view.bounds.width * 0.9
    }
    
    func didLoadStory() {
        storyCollectionView.reloadData()
    }
    
    func failLoadStory() {
        
    }
    
    
    lazy var storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellLayoutWidth, height: cellLayoutHeight)
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collection.delegate = viewModel
        collection.dataSource = viewModel
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.cellID)
        collection.backgroundColor = colorBackground
        return collection
    }()
    
    var viewModel: StoryViewModelResponsibilities
    init(viewModel: StoryViewModelResponsibilities) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadStory()
        view.addSubview(storyCollectionView)
        storyCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        storyCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        storyCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        storyCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
//        collectionView?.backgroundColor = colorBackground
//        collectionView?.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.cellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    


}


