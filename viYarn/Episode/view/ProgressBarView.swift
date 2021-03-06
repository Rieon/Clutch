//
//  ProgressBarView.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {

    var progress = UIView()
    var progressWidthAnchor: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        progress.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        progress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(progress)
        
        
        progress.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        progress.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        progress.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        progressWidthAnchor = progress.widthAnchor.constraint(equalToConstant: 0)
        progressWidthAnchor?.isActive = true
    }
    
    func setProgress(to progress: CGFloat, fromWidth width: CGFloat){
        progressWidthAnchor?.constant = width * progress
        UIView.animate(withDuration: 0.2) { [unowned self] in
            self.layoutIfNeeded()
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
