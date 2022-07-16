//
//  HomeViewController.swift
//  FlyyAssignment
//
//  Created by Ajitkumar Marigoli on 16/07/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    let topCollectionViewCellId = "TopCollectionViewCell"
    let bottomCollectionViewCellId = "BottomCollectionViewCell"
    
    var collectionModels: [CollectionModel] = []
    
    var collectionModel: CollectionModel?
    var topSection: Section?
    var bottomSection: Section?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getJsonData(jsonFileName: "FlyyXTestApp")
        for collectionModel in self.collectionModels{
            if collectionModel.sequence == 1{
                self.collectionModel = collectionModel
            }
        }
        if let collectionModel = self.collectionModel{
            if let sections = collectionModel.sections{
                for section in sections{
                    if section.sectionType == .TOP{
                        self.topSection = section
                    }else if section.sectionType == .BOTTOM{
                        self.bottomSection = section
                    }
                }
            }
        }
        
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = collectionModel?.title
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        self.topLabel.text = self.topSection?.sectionTitle
        self.bottomLabel.text = self.bottomSection?.sectionTitle
        
        self.topCollectionView.delegate = self
        self.bottomCollectionView.delegate = self

        self.topCollectionView.dataSource = self
        self.bottomCollectionView.dataSource = self
        
        self.topCollectionView.register(UINib(nibName: "TopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopCollectionViewCell")
        self.bottomCollectionView.register(UINib(nibName: "BottomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BottomCollectionViewCell")
    }
    
    private func getJsonData(jsonFileName: String){
        if let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let collectionModels = try decoder.decode([CollectionModel].self, from: data)
                self.collectionModels = collectionModels
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topCollectionView{
            return self.topSection?.cells?.count ?? 0
        }
        return self.bottomSection?.cells?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.topCollectionView{
            if let model = self.topSection?.cells?[indexPath.row]{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCollectionViewCellId, for: indexPath) as! TopCollectionViewCell
                cell.setUpCell(topCollectionModel: model)
                return cell
            }
        }else{
            if let model = self.bottomSection?.cells?[indexPath.row]{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCollectionViewCellId, for: indexPath) as! BottomCollectionViewCell
                cell.setUpCell(bottomCollectionModel: model)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.topCollectionView{
            return CGSize(width: (collectionView.frame.width - 100) , height: collectionView.frame.height)
        }else{
            return CGSize(width: (collectionView.frame.width - 200) , height: collectionView.frame.height - 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension UIView {
    public func addBorder(borderColor: CGColor, borderWidth: CGFloat){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.masksToBounds = true
    }
    
    public func addCornerRadius(cornerRadius: CGFloat){
        self.layer.cornerRadius = cornerRadius
    }
    
    public func addShadow(color: CGColor, opacity: CGFloat, radius: CGFloat, offset:CGSize){
        self.layer.shadowColor = color
        self.layer.shadowOpacity = Float(opacity)
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.masksToBounds = true
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
