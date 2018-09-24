//
//  ChatTableViewController.swift
//  viYarn
//
//  Created by vieon on 23.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class ChatTableViewController: UITableViewController {

    let messages = ["lol",
                    "lol lol lolo lol lol lol lol lolo lol lol lol lol lolo lol lol lol lol lolo lol lol",
                    "lol lol lolo lol lol lol lol lololol lol lolo lol lol lol lol lololol lol lolo lol lol lol lol lololol lol lolo lol lol lol lol lolo lol lol lolo lol lol lol lol lolo",
                    "lol lol lolo lol lol lol lol lolo "]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.cellID)
        tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.cellID, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        cell.isAuthor = indexPath.row % 2 == 0
        return cell.configured(message: messages[indexPath.row])
    }
 

}
