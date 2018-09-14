//
//  EpisodeTableViewController.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class EpisodeTableViewController: UITableViewController {
    
    let arr = ["Desctiption1", "Desctiption2"]

    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    override func viewDidLoad() {
        
        
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
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.cellID) as? EpisodeTableViewCell {
            return cell.configured(for: indexPath.row, with: arr[indexPath.row])
        }
        
        return UITableViewCell()
    }

    @objc func onClickDone(){
        
    }

    
}

