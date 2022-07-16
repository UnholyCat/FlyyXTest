//
//  TopCollectionViewCell.swift
//  FlyyAssignment
//
//  Created by Ajitkumar Marigoli on 16/07/22.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topCellView: UIView!
    @IBOutlet weak var topCellImageView: UIImageView!
    @IBOutlet weak var imageLabelIcon: UIImageView!
    @IBOutlet weak var imageSubTitle: UILabel!
    @IBOutlet weak var subTitle1: UILabel!
    @IBOutlet weak var subTitle2: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle3: UILabel!
    @IBOutlet weak var subTitle4: UILabel!
    @IBOutlet weak var imageSubtitleStack: UIStackView!
    
    var topCollectionModel: Cell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(topCollectionModel: Cell){
        self.topCellView.layer.cornerRadius = 8
        self.topCellImageView.layer.masksToBounds = true
        self.topCellView.addBorder(borderColor: UIColor.black.cgColor, borderWidth: 0.05)
        self.topCollectionModel = topCollectionModel
        if let imageName = topCollectionModel.image{
            self.topCellImageView.image = UIImage(named: imageName)
            self.topCellImageView.contentMode = .scaleAspectFill
        }
        if let imageSubTitleIcon = topCollectionModel.imageSubtitleIcon{
            self.imageLabelIcon.image = UIImage(named: imageSubTitleIcon)
            self.imageLabelIcon.contentMode = .scaleAspectFit
        }
        self.imageSubtitleStack.layer.cornerRadius = 8
        self.imageSubTitle.text = topCollectionModel.imageSubtitle
        self.subTitle1.text = topCollectionModel.subtitle1
        self.subTitle2.text = topCollectionModel.subtitle2
        self.title.text = topCollectionModel.title
        self.subTitle3.text = topCollectionModel.subtitle3
        self.subTitle4.text = topCollectionModel.subtitle4
    }

}

