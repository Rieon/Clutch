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
    var messages = [ChatElement]()
    
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapChat(recognizer:)))
        self.view.addGestureRecognizer(tapGesture)
        self.navigationItem.title = loadedEpisodeContent.episodeDescription
        tableView.separatorStyle = .none
    }
    
    @objc func handleTapChat(recognizer : UITapGestureRecognizer) {
        
        if messages.count < loadedEpisodeContent.chatMessages.count {
            messages.append(loadedEpisodeContent.chatMessages[messages.count])
            let indexRow = IndexPath(row: messages.count - 1, section: 0)
            tableView.insertRows(at: [indexRow], with: .automatic)
            tableView.scrollToRow(at: indexRow, at: .bottom, animated: true)
        } else {
            print("chat end")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatElement = messages[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell\(chatElement.type)", for: indexPath)
        if let configurableCell = cell as? ChatViewCell {
            configurableCell.configured(with: chatElement)
        }
        return cell
    }
 

}
