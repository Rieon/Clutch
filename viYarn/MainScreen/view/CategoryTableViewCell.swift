//
//  CategoryTableViewCell.swift
//  viYarn
//
//  Created by vieon on 28.09.2018.
//  Copyright © 2018 RIEON. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    

    static let cellID = "categoryCell"
    
    var didSelectStory: ((Int, Int) -> Void)?
    let txtTitle: UILabel = {
        let txt = UILabel()
        txt.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        txt.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    lazy var collectionCategory: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 170)
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
        collection.register(StoryCategoryCell.self, forCellWithReuseIdentifier: StoryCategoryCell.cellID)
        return collection
    }()
    
    var stories = [Story]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
    
        contentView.addSubview(txtTitle)
        
        txtTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        txtTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        txtTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        txtTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(collectionCategory)
        collectionCategory.topAnchor.constraint(equalTo: txtTitle.bottomAnchor, constant: 2).isActive = true
        collectionCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:0).isActive = true
        collectionCategory.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        collectionCategory.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
    }
    
    func loadStoriesForCategory(_ category: Category, didLoad: @escaping () -> Void, failLoad: @escaping (Error) -> Void) {
        APIClient.instance.request(forID: category.id, typeRequest: .getStory, typePost: .story, success: { [unowned self] (loadedStory) in
            guard let postsJson = loadedStory["posts"] as? [[String : Any]] else {
                return failLoad(ParsingError.wrongData)
            }
            var postsArr = [Story]()
            for postJson in postsJson {
                guard let post = Story(json: postJson) else { return }
                postsArr.append(post)
            }
            self.stories = postsArr
            didLoad()
        }) { (error) in
            failLoad(error)
        }
    }
    
    
    func configured(for category: Category, index: Int , didSelectStory: ((Int, Int) -> Void)?) {
        txtTitle.text = category.name
        txtTitle.tag = index
        self.didSelectStory = didSelectStory
        loadStoriesForCategory(category, didLoad: {
            self.collectionCategory.reloadData()
        }) { (error) in
            
        }
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionCategory.dequeueReusableCell(withReuseIdentifier: StoryCategoryCell.cellID, for: indexPath) as? StoryCategoryCell else {
            return UICollectionViewCell()
        }
        cell.setImage(url: stories[indexPath.row].urlImage)
    return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectStory?(txtTitle.tag, indexPath.row)
    }

}
