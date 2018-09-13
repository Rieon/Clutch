//
//  EpisodeTableViewCell.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    let txtTitle:UILabel = UILabel()
    let txtDesc:UILabel = UILabel()
    let radiusButton:CGFloat = 28
    let containerInfo:UIView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(data:EpisodeMO){
        let btnRestore = CircleButton(frame: CGRect(x: 0, y: 0, width: radiusButton, height: radiusButton))
        
        btnRestore.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.4588235294, alpha: 1)
        btnRestore.translatesAutoresizingMaskIntoConstraints = false
        addSubview(btnRestore)
        btnRestore.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 13).isActive = true
        btnRestore.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        btnRestore.widthAnchor.constraint(equalToConstant: radiusButton).isActive = true
        btnRestore.heightAnchor.constraint(equalToConstant: radiusButton).isActive = true
        
        containerInfo.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerInfo)
        
        containerInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        containerInfo.leftAnchor.constraint(equalTo: btnRestore.rightAnchor, constant: 13).isActive = true
        containerInfo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 5).isActive = true
        containerInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        
        txtTitle.text = data.title
        txtTitle.textColor = #colorLiteral(red: 1, green: 0, blue: 0.4588235294, alpha: 1)
        txtTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        containerInfo.addSubview(txtTitle)
        
        txtTitle.topAnchor.constraint(equalTo: containerInfo.topAnchor, constant: 0).isActive = true
        txtTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtTitle.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
        txtTitle.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        txtDesc.text = data.desc
        txtDesc.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        txtDesc.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        txtDesc.translatesAutoresizingMaskIntoConstraints = false
        containerInfo.addSubview(txtDesc)
        
        txtDesc.topAnchor.constraint(equalTo: txtTitle.bottomAnchor, constant: 0).isActive = true
        txtDesc.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtDesc.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
        txtDesc.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        let progressLine = ProgressBarView()
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        containerInfo.addSubview(progressLine)
        
//        containerInfo.topAnchor.constraint(equalTo: txtDesc.bottomAnchor, constant: 0).isActive = true
//        containerInfo.heightAnchor.constraint(equalToConstant: 3).isActive = true
//        containerInfo.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
//        containerInfo.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
