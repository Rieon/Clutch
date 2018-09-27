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
    
    static let cellID = "cellimage"
    
    var leadingBubbleConstrain: NSLayoutConstraint?
    var trailingBubbleConstrain: NSLayoutConstraint?
    
    let imgChat: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "placeholder")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let sizeImage = CGSize(width: 200, height: 250)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imgChat)
        
        imgChat.heightAnchor.constraint(equalToConstant: sizeImage.height).isActive = true
        imgChat.widthAnchor.constraint(equalToConstant: sizeImage.width).isActive = true
        imgChat.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imgChat.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true

        
        leadingBubbleConstrain = imgChat.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        trailingBubbleConstrain = imgChat.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
    }
    
    func configured(with chatElement: ChatElement) {
        if let url = URL(string: chatElement.message) {
            imgChat.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
        leadingBubbleConstrain?.isActive = !chatElement.isAuthor
        trailingBubbleConstrain?.isActive = chatElement.isAuthor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
