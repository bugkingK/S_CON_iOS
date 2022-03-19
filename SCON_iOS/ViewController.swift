//
//  ViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/19.
//

import UIKit

class ViewController: UIViewController {
    
    let awardNameList = ["대상", "금상", "은상", "동상", "장려상", "인기상"]

    @IBOutlet weak var awardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        awardCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        awardCollectionView.dataSource = self
        awardCollectionView.delegate = self
        
        
    }


}



//MARK: - ColletionView Delegate
extension ViewController: UICollectionViewDelegate{
    
}

//MARK: - ColletionView DataSource
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(self.awardNameList.count)")
        return self.awardNameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "awardCell", for: indexPath) as? AwardCollectionViewCell else { return UICollectionViewCell() }
        cell.labelText.text = self.awardNameList[indexPath.row]
        cell.imageView.image = UIImage(named: "\(self.awardNameList[indexPath.row])")
        return cell
    }
    
    
}
