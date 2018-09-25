//
//  StoryViewController.swift
//  viYarn
//
//  Created by vieon on 14.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    private var cellLayoutHeight: CGFloat {
        return view.bounds.height * 0.7
    }
    private var cellLayoutWidth: CGFloat {
        return view.bounds.width * 0.9
    }
    
    var stories = [Story]()
    let didTapEpisode: (Int) -> Void
    
    lazy var storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellLayoutWidth, height: cellLayoutHeight)
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.cellID)
        collection.backgroundColor = colorBackground
        return collection
    }()
    
    init(didTapEpisode: @escaping (Int) -> Void) {
        self.didTapEpisode = didTapEpisode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadEpisode(categoryID: 2, didLoad: loadStoryByCategory, failLoad: failLoadStory)
        
        view.addSubview(storyCollectionView)
        storyCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        storyCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        storyCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        storyCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.cellID,
                                                         for: indexPath as IndexPath) as? StoryCollectionViewCell {
            return cell.configured(story: stories[indexPath.row], with: stories[indexPath.row].id, with: self.didTapEpisode)
        }
        return UICollectionViewCell()
    }
    
    func loadEpisode(categoryID: Int, didLoad: @escaping () -> Void, failLoad: @escaping (Error) -> Void) {
        APIClient.instance.request(forID: categoryID, typeRequest: .getStory, typePost: .story, success: { [unowned self] (loadedStory) in
            
            guard let postsJson = loadedStory["posts"] as? [[String : Any]] else {
                return failLoad(ParsingError.wrongData)
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
    
    func loadStoryByCategory(){
        self.storyCollectionView.reloadData()
    }
    func failLoadStory(error: Error){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


