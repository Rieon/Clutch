//
//  CircleButton.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class CircleButton: UIButton {


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
