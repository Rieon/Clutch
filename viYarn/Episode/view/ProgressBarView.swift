//
//  ProgressBarView.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {

    var progressLayer:CALayer = CALayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        progressLayer.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        self.layer.addSublayer(progressLayer)
    }
    
    func setProgress(proc:CGFloat){
        // temp
        progressLayer.frame = CGRect(x: 0, y: 0, width: proc, height: self.frame.height)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
