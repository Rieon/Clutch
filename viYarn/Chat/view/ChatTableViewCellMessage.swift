//
//  ChatTableViewCell.swift
//  viYarn
//
//  Created by vieon on 23.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

protocol ChatViewCell {
    func configured(with chatElement: ChatElement)
}

class ChatTableViewCellMessage: UITableViewCell, ChatViewCell {

    static let cellID = "cellMessage"
    
    var leadingBubbleConstrain: NSLayoutConstraint?
    var trailingBubbleConstrain: NSLayoutConstraint?
    
    let txtMessage: UILabel = {
        let txt = UILabel()
        txt.numberOfLines = 0
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let bubbleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.yellow
        view.layer.cornerRadius = 10
        return view
    }()
    let txtNameAuthor: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 1, green: 0, blue: 0.4588235294, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(txtNameAuthor)
        txtNameAuthor.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        txtNameAuthor.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        txtNameAuthor.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        addSubview(bubbleView)
        
        bubbleView.topAnchor.constraint(equalTo: txtNameAuthor.bottomAnchor, constant: 5).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        let widthBubbleConstrain = bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        widthBubbleConstrain.priority = .defaultHigh
        widthBubbleConstrain.isActive = true
        
        bubbleView.addSubview(txtMessage)
        
        txtMessage.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 8).isActive = true
        txtMessage.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 8).isActive = true
        txtMessage.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -8).isActive = true
        txtMessage.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -8).isActive = true
        
        leadingBubbleConstrain = bubbleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        trailingBubbleConstrain = bubbleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
    }
    func configured(with chatElement: ChatElement) {
        txtMessage.text = chatElement.message
        txtNameAuthor.text = chatElement.author
        
        bubbleView.backgroundColor = chatElement.isAuthor ? UIColor.lightGray : UIColor.darkGray
        txtMessage.textColor = chatElement.isAuthor ? UIColor.black : UIColor.white
        leadingBubbleConstrain?.isActive = !chatElement.isAuthor
        trailingBubbleConstrain?.isActive = chatElement.isAuthor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
