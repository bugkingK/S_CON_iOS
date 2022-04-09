//
//  TwentyViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/23.
//

import UIKit

class Cate2020ViewController: UIViewController {
    
    var arrData = [Header]()

    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //데이터 추가
        arrData.append(Header(header: "대상", dataList: [Data(title: "BOOKREST", discription: "교내 전공 서적 서비스", photo: UIImage(named: "main")),
                                                       Data(title: "title2", discription: "dis2", photo: UIImage(systemName: "house")),
                                                         Data(title: "title3", discription: "dis2", photo: UIImage(systemName: "house"))]))
        arrData.append(Header(header: "금상", dataList: [Data(title: "h1", discription: "d2", photo: UIImage(systemName: "house")),
                                                       Data(title: "32", discription: "d1", photo: UIImage(systemName: "house"))]))
        
        
        self.collectionView.collectionViewLayout = createLayout()
        
    }
    
    

    
}



//MARK: - UICollectionViewDataSource
extension Cate2020ViewController: UICollectionViewDataSource{
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
            headerView.titleLabel.text = self.arrData[indexPath.section].header
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
//    //섹션의 헤더 사이즈 설정
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        let width: CGFloat = collectionView.frame.width
//        let height: CGFloat = 20
//        return CGSize(width: width, height: height)
//    }


   
   
}


//MARK: - UICollectionViewDelegate
extension Cate2020ViewController: UICollectionViewDelegate{
    //셀 선택시 동작
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController else { return }
        //카테고리 VC로 값 전달할 코드
        detailVC.navTitle = self.arrData[indexPath.section].dataList[indexPath.row].title
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
