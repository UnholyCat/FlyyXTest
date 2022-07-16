//
//  BottomCollectionViewCell.swift
//  FlyyAssignment
//
//  Created by Ajitkumar Marigoli on 16/07/22.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bottomCellView: UIView!
    @IBOutlet weak var bottomCellStack: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subTitle1: UILabel!
    @IBOutlet weak var subTitle2: UILabel!
    @IBOutlet weak var subTitle3: UILabel!
    @IBOutlet weak var subTitle4: UILabel!
    
    var bottomCollectionModel: Cell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(bottomCollectionModel: Cell){
        self.bottomCellView.layer.cornerRadius = 8
        self.imageView.layer.masksToBounds = true
        self.bottomCellView.addBorder(borderColor: UIColor.black.cgColor, borderWidth: 0.05)
        self.bottomCollectionModel = bottomCollectionModel
        if let imageName = bottomCollectionModel.image{
            self.imageView.image = UIImage(systemName: imageName)
            self.imageView.contentMode = .scaleAspectFit
        }
        self.subTitle1.text = bottomCollectionModel.subtitle1
        self.subTitle2.text = bottomCollectionModel.subtitle2
        self.subTitle3.text = bottomCollectionModel.subtitle3
        self.subTitle4.text = bottomCollectionModel.subtitle4
    }

}
