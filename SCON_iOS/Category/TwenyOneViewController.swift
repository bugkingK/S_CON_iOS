//
//  TwenyOneViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/23.
//

import UIKit

class TwenyOneViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.collectionViewLayout = createLayout()
        //헤더 설정
//        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        
    }
    
    

    
}

//MARK: - CollectionView Layout 설정
extension TwenyOneViewController {
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
            
            
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(40))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            section.boundarySupplementaryItems = [titleSupplementary]
            return section
            
        }
        return layout
    }
    
}

//MARK: - UICollectionViewDataSource
extension TwenyOneViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCollectionViewCell", for: indexPath) as? WorkCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
        cell.titleLabel.text = "타이틀 \(indexPath.row)"
        cell.descriptionLabel.text = "서브 \(indexPath.row)"
        //셀 그림자 설정
        cell.layer.borderWidth = CGFloat(1)
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
              withReuseIdentifier: "HeaderCollectionReusableView",
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
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        let width: CGFloat = collectionView.frame.width
//        let height: CGFloat = 20
//        return CGSize(width: width, height: height)
//    }


   
   
}


//MARK: - UICollectionViewDelegate
extension TwenyOneViewController: UICollectionViewDelegate{
    
}
