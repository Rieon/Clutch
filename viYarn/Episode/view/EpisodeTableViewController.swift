//
//  EpisodeTableViewController.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class EpisodeTableViewController: UITableViewController {
    
    // example
    let arr:[EpisodeMO] = [
        EpisodeMO(num: 1, title: "Episode 1", desc: "A modern take on the classic novel", isActive: true, progressCompleate: 5),
        EpisodeMO(num: 2, title: "Episode 2", desc: "the party.", isActive: true, progressCompleate: 0),
        EpisodeMO(num: 2, title: "Episode 3", desc: "the party 3", isActive: true, progressCompleate: 0)
        
    ]
    
    let colorBackground:UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        tableView.register(EpisodeTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = colorBackground
        view.backgroundColor = colorBackground
        tableView.separatorStyle = .none
        tableView.rowHeight = 70
        
        // navi head
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = colorBackground
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        navigationItem.titleView = title
        title.text = "Book"
        title.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        title.textAlignment = .center
        title.textColor = .white
  
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(closeView))
        btnDone.tintColor = .white
        navigationItem.rightBarButtonItem = btnDone
    }
    
    @objc func closeView(){
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:EpisodeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EpisodeTableViewCell
        cell.setData(data: arr[indexPath.row])
        cell.backgroundColor = colorBackground
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

