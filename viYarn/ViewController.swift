//
//  ViewController.swift
//  viYarn
//
//  Created by vieon on 13.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        let btnShowEpisode = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        btnShowEpisode.setTitle("Show Episode", for: .normal)
        btnShowEpisode.translatesAutoresizingMaskIntoConstraints = false
        btnShowEpisode.addTarget(self, action: #selector(showEpisode), for: .touchUpInside)
        view.addSubview(btnShowEpisode)
        
        btnShowEpisode.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnShowEpisode.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func showEpisode(){
//        show(EpisodeTableViewController(), sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

