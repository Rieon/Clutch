//
//  MainScreenTableViewController.swift
//  viYarn
//
//  Created by vieon on 28.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class MainScreenTableViewController: UITableViewController {
    
    let colorBackground: UIColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)

    override func viewDidLoad() {
        self.tableView.backgroundColor = colorBackground
        
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }



}
