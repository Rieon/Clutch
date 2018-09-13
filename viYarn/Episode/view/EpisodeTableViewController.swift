//
//  EpisodeTableViewController.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class EpisodeTableViewController: UITableViewController,EpisodeDelegate {
    
    let arr:[Episode] = [
        Episode(num: 1, title: "Episode 1", desc: "A modern take on the classic novel", isActive: true, progressCompleate: 100),
        Episode(num: 2, title: "Episode 2", desc: "the party.", isActive: true, progressCompleate: 20),
        Episode(num: 3, title: "Episode 3", desc: "the party 3", isActive: true, progressCompleate: 10),
        Episode(num: 4, title: "Episode 3", desc: "the party 4", isActive: true, progressCompleate: 5),
        Episode(num: 4, title: "Episode 4", desc: "the party 4", isActive: false, progressCompleate: 0)
        
    ]
    
    let colorBackground:UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        tableView.register(EpisodeTableViewCell.self, forCellReuseIdentifier: EpisodeTableViewCell.CELL_KEY)
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
        if let cell:EpisodeTableViewCell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.CELL_KEY) as? EpisodeTableViewCell
        {
            cell.delegate = self
            cell.setData(data: arr[indexPath.row])
            cell.backgroundColor = colorBackground
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @objc func onClickDone(){
        
    }
    
    func onRestoreBtn(obj: Episode) {
        print(obj.num)
    }
    
}

