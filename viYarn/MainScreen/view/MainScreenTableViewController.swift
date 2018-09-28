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
    var categories = [Category]()
    let tabCategory: (Category) -> Void
    
    init(didTapCategory: @escaping (Category) -> Void) {
        self.tabCategory = didTapCategory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        loadCategories(didLoad: loadedCategories, failLoad: failLoad)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.cellID)
        tableView.backgroundColor = colorBackground
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        super.viewDidLoad()
    }


    func loadCategories(didLoad: @escaping([Category]) -> Void, failLoad: @escaping(Error) -> Void) {
        APIClient.instance.request(typeRequest: .getCategories, success: {(loadCategories) in
            guard let postsJson = loadCategories["categories"] as? [[String : Any]] else {
                return failLoad(ParsingError.wrongData)
            }
            var postsArr = [Category]()
            for postJson in postsJson {
                guard let post = Category(json: postJson) else { return }
                postsArr.append(post)
            }
            didLoad(postsArr)
        }) { (error) in
            failLoad(error)
        }
        
    }
    func loadedCategories(categories: [Category]) -> Void {
        self.categories = categories
        tableView.reloadData()
    }
    
    func failLoad(error: Error) -> Void {
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.cellID, for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        cell.configured(for: categories[indexPath.row], index: indexPath.row, didSelectStory: didSelectStory)
        return cell
        
    }
    
    func didSelectStory(id: Int, selectRow: Int) {
        tabCategory(categories[id])
    }



}
