//
//  HomeViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/19.
//

import UIKit
import JJFloatingActionButton


// 컨트롤러를 계속 생성하고 보여주고
// 스토리보드를 생성하고, 이름 갖고오고, 뷰컨트롤러 찾고, 그리고 값도 넣고, 캐스팅도하고




final class HomeViewController: UIViewController {
    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var mainTableView: UITableView!
    
    private var contestSortList: [ContestList.ContestSort] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        setupLayout()
    }
    
    private func setupLayout() {
        navigationController?.customNavigation()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.isScrollEnabled = false //스크롤 금지
        //플러팅 버튼 구성
        configureFloatingButton()
    }

    private func bindData() {
        //리스트 넘겨 받음
        let result = APIKit.shared.request(url: "ContestList", type: ContestList.self)
        switch result{
        case .success(let data):
            self.contestSortList = data.data
        case .failure(let error):
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    private func urlToWebView(_ url: String, title: String){
        let webVC = WebViewController()
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
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contestSortList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.data = contestSortList[indexPath.row]
        //이미지 설정
//        let image = UIImage(systemName: data.systemImg)?.withTintColor(data.imgColor, renderingMode: .alwaysOriginal)
//        cell.imgView.image = image
//
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = CategoryViewController.createInstance(sbName: "Category")
        vc.contestListId = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
