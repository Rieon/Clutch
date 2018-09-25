//
//  EpisodeTableViewCell.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit


class EpisodeTableViewCell: UITableViewCell {

    static let cellID = "episode"
    
    let txtTitle: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 1, green: 0, blue: 0.4588235294, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let txtDesc: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let radiusButton: CGFloat = 30
    let containerInfo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let progressLine: ProgressBarView = {
        let view = ProgressBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    lazy var btnRestore: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 0.5 * radiusButton
        btn.clipsToBounds = true
        btn.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.4588235294, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
        self.selectionStyle = .none
        
        
        contentView.addSubview(btnRestore)
        btnRestore.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 13).isActive = true
        btnRestore.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        btnRestore.widthAnchor.constraint(equalToConstant: radiusButton).isActive = true
        btnRestore.heightAnchor.constraint(equalToConstant: radiusButton).isActive = true
        
        contentView.addSubview(containerInfo)
        
        containerInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        containerInfo.leftAnchor.constraint(equalTo: btnRestore.rightAnchor, constant: 13).isActive = true
        containerInfo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        containerInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        
        containerInfo.addSubview(txtTitle)
        
        txtTitle.topAnchor.constraint(equalTo: containerInfo.topAnchor, constant: 0).isActive = true
        txtTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtTitle.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
        txtTitle.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        containerInfo.addSubview(txtDesc)
        
        txtDesc.topAnchor.constraint(equalTo: txtTitle.bottomAnchor, constant: 0).isActive = true
        txtDesc.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtDesc.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
        txtDesc.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        
        containerInfo.addSubview(progressLine)
        progressLine.topAnchor.constraint(equalTo: txtDesc.bottomAnchor, constant: 3).isActive = true
        progressLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        progressLine.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
        progressLine.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        layoutIfNeeded()
    
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func configured(for index: Int, with episode: Episode) -> EpisodeTableViewCell {
        txtTitle.text = episode.title
        txtDesc.text = episode.content.episodeDescription
        
        progressLine.setProgress(to: 0.1, fromWidth: containerInfo.bounds.width)

        
        return self
    }


}
