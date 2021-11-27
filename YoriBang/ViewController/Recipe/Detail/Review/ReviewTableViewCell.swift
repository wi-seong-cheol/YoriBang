//
//  ReviewTableViewCell.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/23.
//

import Foundation
import UIKit

protocol CVCellDelegate {
    func selectedCVCell(_ index: Int)
}

class ReviewTableViewCell: UITableViewCell {
    static let identifier = "ReviewTableViewCell"
    @IBOutlet weak var Profile: UIImageView!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Nickname: UILabel!
    @IBOutlet weak var Desc: UILabel!
    var delegate: CVCellDelegate?
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var reviewImages: [UIImage] = [
        UIImage(named: "Image5") ?? UIImage(),
        UIImage(named: "Image6") ?? UIImage()
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure() {
        // Set CollectionView
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
        // Set Font
        Nickname.font = UIFont.NotoSansCJKkr(type: .medium, size: 10)
        Time.font = UIFont.NotoSansCJKkr(type: .regular, size: 8)
        Desc.font = UIFont.NotoSansCJKkr(type: .regular, size: 10)
        
        // Set View
        Profile.layer.cornerRadius = Profile.frame.width/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ReviewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: ReviewCollectionViewCell.identifier, for: indexPath) as? ReviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        let width = cell.image.frame.width
        let height = cell.image.frame.height
        cell.image.image = reviewImages[indexPath.row].crop(rect: CGRect(x: 0, y: 0, width: width, height: height))
        return cell
    }
}
//extension ReviewTableViewCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellHeight = collectionView.frame.height
//        let cellWidth = collectionView.frame.width / 3
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return lineSpacing
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: horizonInset, bottom: 0, right: horizonInset)
//    }
//}
extension ReviewTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.selectedCVCell(indexPath.item)
        }
    }
}
