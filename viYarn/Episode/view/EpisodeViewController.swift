//
//  EpisodeTableViewController.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    func didLoadEpisodes() {
        episodesTableView.reloadData()
    }
    
    func failLoadEpisodes() {
        
    }
    
    
    lazy var episodesTableView: UITableView = {
        let table = UITableView()
        table.delegate = viewModel
        table.dataSource = viewModel
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(EpisodeTableViewCell.self, forCellReuseIdentifier: EpisodeTableViewCell.cellID)
        table.backgroundColor = colorBackground
        table.separatorStyle = .none
        table.rowHeight = 70
        return table
    }()
    
    var viewModel: EpisodesViewModelResponsibilities
    init(viewModel: EpisodesViewModelResponsibilities) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    override func viewDidLoad() {
        viewModel.loadEpisode(storyID: 37, didLoad: didLoadEpisodes, failLoad: failLoadEpisodes)
        view.backgroundColor = colorBackground
        super.viewDidLoad()
        
        
        view.addSubview(episodesTableView)
        episodesTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        episodesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        episodesTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        episodesTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    


    @objc func onClickDone(){
        
    }

    
}

