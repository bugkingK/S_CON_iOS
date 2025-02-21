//
//  ViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/19.
//
import UIKit
import JJFloatingActionButton
import FirebaseAuth

struct ContestName{
    let name: String
    let systemImg: String
    let imgColor: UIColor
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var mainTableView: UITableView!
    let mainList = [ContestName(name: "IT 부문", systemImg: "tv.circle.fill", imgColor: .blue),
                    ContestName(name: "미디어콘텐츠 부문", systemImg: "headphones.circle.fill", imgColor: .orange),
                    ContestName(name: "SW 경진대회", systemImg: "wave.3.right.circle.fill", imgColor: .green)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.customNavigation()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.isScrollEnabled = false //스크롤 금지
        
        //플러팅 버튼 구성
        self.configureFloatingButton()
        
        //[보류] 로그인 시 메인 라벨 변경
//        let email = Auth.auth().currentUser?.email ?? "없음"
//        self.mainTitleLabel.text = """
//        \(email)님 경진대회 확인
//        """
                    
    }
    
    private func urlToWebView(_ url: String, title: String){
        guard let webVC = self.storyboard?.instantiateViewController(withIdentifier: "webVC") as? WebViewController else { return }
        webVC.url = url
        webVC.navigationTItle = title
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    private func configureFloatingButton(){
        let actionButton = JJFloatingActionButton()
        actionButton.buttonColor = UIColor(named: "darkYellow") ?? .yellow
        //1
        actionButton.addItem(title: "작품 추가", image: UIImage(systemName: "folder.badge.plus")?.withRenderingMode(.alwaysTemplate)) { item in
            let title = item.titleLabel.text
            self.urlToWebView("https://forms.gle/PQr8et2TZPMXg9Yu5", title: title ?? "")
            
        }
        //2
        actionButton.addItem(title: "개선사항 전달", image: UIImage(systemName: "paperplane")?.withRenderingMode(.alwaysTemplate)) { item in
            let title = item.titleLabel.text
            self.urlToWebView("https://open.kakao.com/o/syVEDP8d", title: title ?? "")
        }
        //3
        actionButton.addItem(title: "개발자 소개", image: UIImage(systemName: "person.fill")) { item in
          // do something
        }
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
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
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Category", bundle: nil)
        guard let categoryVC = storyboard.instantiateViewController(withIdentifier: "CategoryVC") as? CategoryViewController else { return }
        //카테고리 VC로 값 전달할 코드
        
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
}
