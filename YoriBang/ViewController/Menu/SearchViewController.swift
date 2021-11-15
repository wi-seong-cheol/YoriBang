//
//  MenuViewController.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/06.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UISearchBar!
    @IBOutlet weak var TagCollectionView: UICollectionView!
    
    var letters = ["안녕","안녕하세요","안녕하세요 저는 포마입니다.","안녕하세요 만나서 정말 반갑습니다."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        TagCollectionView.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
        if let flowLayout = TagCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        TagCollectionView.delegate = self
        TagCollectionView.dataSource = self
    }
    
    @IBAction func OKBtn(_ sender: Any) {
//        beforeTrim.

        if let text = searchTextField.text {
           
            letters.append(text)
            TagCollectionView.reloadData()
        }
        
    }
}

extension SearchViewController:UICollectionViewDelegate {
    
}

extension SearchViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TagCollectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
        
        cell.label.text = letters[indexPath.item]
        
        return cell
    }
}


