//
//  ChatTableViewController.swift
//  viYarn
//
//  Created by vieon on 23.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class ChatTableViewController: UITableViewController {

    let loadedEpisodeContent: EpisodeContent
    init(loadedEpisodeContent: EpisodeContent) {
        self.loadedEpisodeContent = loadedEpisodeContent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(ChatTableViewCellImage.self, forCellReuseIdentifier: ChatTableViewCellImage.cellID)
        tableView.register(ChatTableViewCellMessage.self, forCellReuseIdentifier: ChatTableViewCellMessage.cellID)
        tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedEpisodeContent.chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatElement = loadedEpisodeContent.chatMessages[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: chatElement.cellID, for: indexPath)
        if let configurableCell = cell as? ChatViewCell {
            configurableCell.configured(with: chatElement)
        }
        return cell
    }
 

}
