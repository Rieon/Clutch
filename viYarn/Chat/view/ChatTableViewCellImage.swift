//
//  ChatTableViewCellImage.swift
//  viYarn
//
//  Created by vieon on 26.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import Foundation
import AlamofireImage
import UIKit

class ChatTableViewCellImage: UITableViewCell, ChatViewCell {
    
    static let cellID = "cellImage"
    
    var leadingBubbleConstrain: NSLayoutConstraint?
    var trailingBubbleConstrain: NSLayoutConstraint?
    
    let imgChat: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "placeholder")
        image.clipsToBounds = true
        return image
    }()
    
    let bubbleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.yellow
        view.layer.cornerRadius = 10
        return view
    }()
    
    let sizeImage = CGSize(width: 200, height: 250)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bubbleView)
        
        bubbleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        let widthBubbleConstrain = bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        widthBubbleConstrain.isActive = true
        
        bubbleView.addSubview(imgChat)
        
        imgChat.heightAnchor.constraint(equalToConstant: sizeImage.height).isActive = true
        imgChat.widthAnchor.constraint(equalToConstant: sizeImage.width).isActive = true
        imgChat.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 8).isActive = true
        imgChat.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 8).isActive = true
        imgChat.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -8).isActive = true
        imgChat.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -8).isActive = true

        
        leadingBubbleConstrain = bubbleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        trailingBubbleConstrain = bubbleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
    }
    
    func configured(with chatElement: ChatElement) {
        if let url = URL(string: chatElement.message) {
            imgChat.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
        bubbleView.backgroundColor = chatElement.isAuthor ? UIColor.lightGray : UIColor.darkGray
        leadingBubbleConstrain?.isActive = !chatElement.isAuthor
        trailingBubbleConstrain?.isActive = chatElement.isAuthor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
