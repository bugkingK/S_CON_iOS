//
//  ViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/19.
//

import UIKit

struct ContestName{
    let name: String
    let systemImg: String
    let imgColor: UIColor
}

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    let mainList = [ContestName(name: "IT 부문", systemImg: "tv.circle.fill", imgColor: .blue),
                    ContestName(name: "미디어콘텐츠 부문", systemImg: "headphones.circle.fill", imgColor: .orange),
                    ContestName(name: "SW 경진대회", systemImg: "wave.3.right.circle.fill", imgColor: .green)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.isScrollEnabled = false //스크롤 금지
    }

}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        let data = mainList[indexPath.row]
        cell.titleLabel.text = data.name
        //이미지 설정
        let image = UIImage(systemName: data.systemImg)?.withTintColor(data.imgColor, renderingMode: .alwaysOriginal)
        cell.imgView.image = image
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storybard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let categoryVC = storybard.instantiateViewController(withIdentifier: "CategoryVC") as? CategoryViewController else { return }
        //카테고리 VC로 값 전달할 코드
        self.show(categoryVC, sender: nil)
    }
}
