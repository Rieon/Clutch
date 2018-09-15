//
//  StoryCollectionViewCell.swift
//  viYarn
//
//  Created by vieon on 15.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "episode"
    
    let imgPreview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let txtCountView: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let txtTitle: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let txtEpisode: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let txtDate: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let txtDesc: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        txt.numberOfLines = 0
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    lazy var btnShowEpisode: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 0.5 * radiusButton
        btn.clipsToBounds = true
        btn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var btnShare: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 0.5 * radiusButton
        btn.clipsToBounds = true
        btn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let txtTitleProgress: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.textAlignment = .center
        return txt
    }()
    
    lazy var viewProgressEpisode: ProgressBarView = {
        let progress = ProgressBarView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.layer.cornerRadius = 5
        progress.clipsToBounds = true
        return progress
    }()
    
    
    
    
    let radiusButton: CGFloat = 40
    
    let containerInfo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(btnShare)
        btnShare.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        btnShare.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        btnShare.heightAnchor.constraint(equalToConstant: radiusButton).isActive = true
        btnShare.widthAnchor.constraint(equalToConstant: radiusButton).isActive = true
        
        contentView.addSubview(btnShowEpisode)
        btnShowEpisode.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        btnShowEpisode.rightAnchor.constraint(equalTo: btnShare.rightAnchor, constant: -(radiusButton + 10)).isActive = true
        btnShowEpisode.heightAnchor.constraint(equalToConstant: radiusButton).isActive = true
        btnShowEpisode.widthAnchor.constraint(equalToConstant: radiusButton).isActive = true
        
        contentView.addSubview(imgPreview)
        imgPreview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgPreview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imgPreview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imgPreview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        contentView.addSubview(containerInfo)
        containerInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
        containerInfo.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        containerInfo.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containerInfo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
        containerInfo.addSubview(txtCountView)
        txtCountView.topAnchor.constraint(equalTo: containerInfo.topAnchor, constant: 10).isActive = true
        txtCountView.rightAnchor.constraint(equalTo: containerInfo.rightAnchor).isActive = true
        txtCountView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtCountView.leftAnchor.constraint(equalTo: containerInfo.leftAnchor).isActive = true
        
        containerInfo.addSubview(txtTitle)
        txtTitle.topAnchor.constraint(equalTo: txtCountView.topAnchor, constant: 20).isActive = true
        txtTitle.rightAnchor.constraint(equalTo: containerInfo.rightAnchor).isActive = true
        txtTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtTitle.leftAnchor.constraint(equalTo: containerInfo.leftAnchor).isActive = true
        
        containerInfo.addSubview(txtEpisode)
        txtEpisode.topAnchor.constraint(equalTo: txtTitle.topAnchor, constant: 20).isActive = true
        txtEpisode.rightAnchor.constraint(equalTo: containerInfo.rightAnchor).isActive = true
        txtEpisode.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtEpisode.leftAnchor.constraint(equalTo: containerInfo.leftAnchor).isActive = true
        
        containerInfo.addSubview(txtDate)
        txtDate.topAnchor.constraint(equalTo: txtEpisode.topAnchor, constant: 20).isActive = true
        txtDate.rightAnchor.constraint(equalTo: containerInfo.rightAnchor).isActive = true
        txtDate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtDate.leftAnchor.constraint(equalTo: containerInfo.leftAnchor).isActive = true
        
        containerInfo.addSubview(txtDesc)
        txtDesc.topAnchor.constraint(equalTo: txtDate.topAnchor, constant: 20).isActive = true
        txtDesc.rightAnchor.constraint(equalTo: containerInfo.rightAnchor).isActive = true
        txtDesc.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        txtDesc.leftAnchor.constraint(equalTo: containerInfo.leftAnchor).isActive = true
        
        contentView.addSubview(viewProgressEpisode)
        viewProgressEpisode.topAnchor.constraint(equalTo: containerInfo.bottomAnchor, constant: 5).isActive = true
        viewProgressEpisode.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        viewProgressEpisode.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        viewProgressEpisode.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        viewProgressEpisode.addSubview(txtTitleProgress)
        txtTitleProgress.topAnchor.constraint(equalTo: viewProgressEpisode.topAnchor, constant: 0).isActive = true
        txtTitleProgress.leftAnchor.constraint(equalTo: viewProgressEpisode.leftAnchor, constant: 0).isActive = true
        txtTitleProgress.rightAnchor.constraint(equalTo: viewProgressEpisode.rightAnchor, constant: 0).isActive = true
        txtTitleProgress.bottomAnchor.constraint(equalTo: viewProgressEpisode.bottomAnchor, constant: 0).isActive = true
        
        
        backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        layoutIfNeeded()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configured() -> StoryCollectionViewCell {
        txtCountView.text = "304,1 k views"
        txtTitle.text = "Little Soldier Girl"
        txtEpisode.text = "Episode 1"
        txtDate.text = "Mon/Wed 11am"
        txtDesc.text = "Description text"
        txtTitleProgress.text = "Start Episode 1"
        
        viewProgressEpisode.setProgress(to: 0.4, fromWidth: viewProgressEpisode.bounds.width)
        
        return self
    }
    
}
