//
//  EpisodeTableViewController.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, EpisodeLoaderDelagate {
    
    lazy var tableView: UITableView = {
        let table:UITableView = UITableView()
        table.delegate = viewModel
        table.dataSource = viewModel
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var viewModel = MockEpisodeViewModel()
    
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    override func viewDidLoad() {
        
        viewModel.delegate = self
        viewModel.loadEpisode()
        
        super.viewDidLoad()
        tableView.register(EpisodeTableViewCell.self, forCellReuseIdentifier: EpisodeTableViewCell.cellID)
        tableView.backgroundColor = colorBackground
        view.backgroundColor = colorBackground
        tableView.separatorStyle = .none
        tableView.rowHeight = 70
        
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = colorBackground
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        navigationItem.titleView = title
        title.text = "Book"
        title.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        title.textAlignment = .center
        title.textColor = .white
        
  
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDone))
        btnDone.tintColor = .white
        navigationItem.rightBarButtonItem = btnDone
        
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
    func didLoad() {
        tableView.reloadData()
    }
    
    func didFail() {
        
    }

    @objc func onClickDone(){
        
    }

    
}

