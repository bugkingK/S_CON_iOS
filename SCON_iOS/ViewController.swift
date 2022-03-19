//
//  ViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/19.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let awardNameList = ["대상", "금상", "은상", "동상", "장려상", "인기상"]

    @IBOutlet weak var lottieView: AnimationView!

    @IBOutlet weak var awardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        awardCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        awardCollectionView.dataSource = self
        awardCollectionView.delegate = self
        //CollectionView Layout 설정
        self.awardCollectionView.collectionViewLayout = createLayout()
        //MARK: - Lottie View
        let animationView = AnimationView(name: "mainLottie")
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        animationView.play()
        
        awardCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
    }


}

//MARK: - CollectionView Layout 설정
extension ViewController {
    // 콤포지셔널 레이아웃 설정
    fileprivate func createLayout() -> UICollectionViewLayout {
        // 레이아웃 생성 - 섹션 > 아이템 > 그룹 이렇게 포함됨
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex: Int, layoutEnvironMent: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            //아이템 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //아이템 간 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5)
            
            //그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(160))
            // 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
        return layout
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
        //셀 그림자 설정
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 4, height: 5)
        cell.layer.shadowRadius = 2
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        return cell
    }
    //섹션의 헤더 사용하기 위해 구현
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
          // 1
          case UICollectionView.elementKindSectionHeader:
            // 2
            let headerView = collectionView.dequeueReusableSupplementaryView(
              ofKind: kind,
              withReuseIdentifier: "headerView",
              for: indexPath)

            // 3
            guard let typedHeaderView = headerView as? HeaderCollectionReusableView
            else { return headerView }

            // 4
            typedHeaderView.titleLabel.text = "수상별 목록"
            return typedHeaderView
          default:
            // 5
            assert(false, "Invalid element type")
          }
    }
    
    
}
