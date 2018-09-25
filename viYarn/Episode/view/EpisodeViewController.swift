//
//  EpisodeTableViewController.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var episodes = [Episode]()
    let loadStoryID: Int
    let didTapEpisode: () -> Void
    
    lazy var episodesTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(EpisodeTableViewCell.self, forCellReuseIdentifier: EpisodeTableViewCell.cellID)
        table.backgroundColor = colorBackground
        table.separatorStyle = .none
        table.rowHeight = 70
        return table
    }()
    
    init(loadStoryID: Int, didTapEpisode: @escaping () -> Void) {
        self.loadStoryID = loadStoryID
        self.didTapEpisode = didTapEpisode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    override func viewDidLoad() {
        loadEpisode(storyID: 37, didLoad: didLoadEpisodes, failLoad: failLoadEpisodes)
        view.backgroundColor = colorBackground
        super.viewDidLoad()
        
        
        view.addSubview(episodesTableView)
        episodesTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        episodesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        episodesTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        episodesTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
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
    
    func didLoadEpisodes() {
        episodesTableView.reloadData()
    }
    
    func failLoadEpisodes(error: Error) {
    }

    @objc func onClickDone(){
        
    }

    
}

