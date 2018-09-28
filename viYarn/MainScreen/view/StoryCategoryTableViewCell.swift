//
//  StoryCategoryTableViewCell.swift
//  viYarn
//
//  Created by vieon on 28.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit
import AlamofireImage

class StoryCategoryCell: UICollectionViewCell {

    static let cellID = "cellStoryCategory"
    
    let imgStory: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "placeholder")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgStory)
        
        imgStory.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgStory.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imgStory.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgStory.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    func setImage(url: String) {
        if let url = URL(string: url) {
            imgStory.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    



}
