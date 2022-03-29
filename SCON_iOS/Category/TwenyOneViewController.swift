//
//  TwenyOneViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/23.
//

import UIKit

struct Header {
    let header: String
    let dataList: [Data]
}

struct Data{
    let title: String
    let discription: String
    let photo: UIImage?
}



class TwenyOneViewController: UIViewController {
    
    var arrData = [Header]()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //데이터 추가
        arrData.append(Header(header: "헤더 1", dataList: [Data(title: "title1", discription: "dis1", photo: UIImage(systemName: "house")),
                                                       Data(title: "title2", discription: "dis2", photo: UIImage(systemName: "house"))]))
        arrData.append(Header(header: "헤더 2", dataList: [Data(title: "h1", discription: "d2", photo: UIImage(systemName: "house")),
                                                       Data(title: "32", discription: "d1", photo: UIImage(systemName: "house"))]))
        
        
        self.collectionView.collectionViewLayout = createLayout()
        
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
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.9))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //아이템 간 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
            
            //그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(200))
            // 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20)
            section.orthogonalScrollingBehavior = .continuous
            
            //섹션 헤더 설정
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(30))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading)
            section.boundarySupplementaryItems = [titleSupplementary]
            return section
            
        }
        return layout
    }
    
}

//MARK: - UICollectionViewDataSource
extension TwenyOneViewController: UICollectionViewDataSource{
    //섹션 당 보여질 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData[section].dataList.count
    }
    //콜렉션 뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCollectionViewCell", for: indexPath) as? WorkCollectionViewCell else { return UICollectionViewCell() }

        cell.imageView.image = arrData[indexPath.section].dataList[indexPath.row].photo
        cell.titleLabel.text = arrData[indexPath.section].dataList[indexPath.row].title
        cell.descriptionLabel.text = arrData[indexPath.section].dataList[indexPath.row].discription
        return cell
    }
    //섹션의 개수 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrData.count
    }
    
    //섹션의 헤더 사용하기 위해 구현
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as? HeaderCollectionReusableView else { fatalError("Could not dequeue Header") }
            headerView.titleLabel.text = arrData[indexPath.section].header
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    //섹션의 헤더 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 30
        return CGSize(width: width, height: height)
    }


   
   
}


//MARK: - UICollectionViewDelegate
extension TwenyOneViewController: UICollectionViewDelegate{
    //셀 선택시 동작
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController else { return }
        //카테고리 VC로 값 전달할 코드
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
