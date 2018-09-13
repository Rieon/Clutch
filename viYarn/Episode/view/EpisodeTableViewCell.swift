//
//  EpisodeTableViewCell.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

protocol EpisodeDelegate:class {
    func onRestoreBtn(obj:Episode)
}

class EpisodeTableViewCell: UITableViewCell {

    static let CELL_KEY = "episode"
    
    let txtTitle = UILabel()
    let txtDesc = UILabel()
    let radiusButton: CGFloat = 30
    let containerInfo = UIView()
    let progressLine = ProgressBarView()
    var episode: Episode?
    
    weak var delegate:EpisodeDelegate?
    
    lazy var btnRestore: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: radiusButton, height: radiusButton)
        btn.layer.cornerRadius = 0.5 * radiusButton
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(onClickRestore), for: .touchUpInside)
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        btnRestore.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.4588235294, alpha: 1)
        btnRestore.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(btnRestore)
        btnRestore.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 13).isActive = true
        btnRestore.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        btnRestore.widthAnchor.constraint(equalToConstant: radiusButton).isActive = true
        btnRestore.heightAnchor.constraint(equalToConstant: radiusButton).isActive = true
        
        containerInfo.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerInfo)
        
        containerInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        containerInfo.leftAnchor.constraint(equalTo: btnRestore.rightAnchor, constant: 13).isActive = true
        containerInfo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        containerInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        
        
        txtTitle.textColor = #colorLiteral(red: 1, green: 0, blue: 0.4588235294, alpha: 1)
        txtTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        containerInfo.addSubview(txtTitle)
        
        txtTitle.topAnchor.constraint(equalTo: containerInfo.topAnchor, constant: 0).isActive = true
        txtTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtTitle.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
        txtTitle.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        txtDesc.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        txtDesc.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        txtDesc.translatesAutoresizingMaskIntoConstraints = false
        containerInfo.addSubview(txtDesc)
        
        txtDesc.topAnchor.constraint(equalTo: txtTitle.bottomAnchor, constant: 0).isActive = true
        txtDesc.heightAnchor.constraint(equalToConstant: 20).isActive = true
        txtDesc.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
        txtDesc.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        containerInfo.addSubview(progressLine)
        progressLine.topAnchor.constraint(equalTo: txtDesc.bottomAnchor, constant: 3).isActive = true
        progressLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        progressLine.leftAnchor.constraint(equalTo: containerInfo.leftAnchor, constant: 0).isActive = true
        progressLine.rightAnchor.constraint(equalTo: containerInfo.rightAnchor, constant: 0).isActive = true
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setData(data:Episode){
        self.episode  = data
        txtTitle.text = data.title
        txtDesc.text = data.desc
        
        progressLine.setProgress(value: data.progressCompleate)
        
        if data.progressCompleate > 0{
            btnRestore.setImage(#imageLiteral(resourceName: "reload"), for: .normal)
        }else{
            btnRestore.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
        btnRestore.tintColor = .white
        
        contentView.alpha = data.isActive ? 1 : 0.5
        
        
    }
    
    @objc func onClickRestore(){
        guard let episode = self.episode else {
            return
        }
        delegate?.onRestoreBtn(obj: episode)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
