//
//  DetailViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/25.
//

import UIKit
import youtube_ios_player_helper

class DetailViewController: UIViewController {
    
    @IBOutlet weak var youtubeView: YTPlayerView!
    @IBOutlet weak var titleView: UIView!
    //타이틀 뷰
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var awardDetailLabel: UILabel!
    //상세 뷰
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var memberInfoLabel: UILabel!
    @IBOutlet weak var devSkillLabel: UILabel!
    @IBOutlet weak var calendarLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeView.load(withVideoId: "VpKfXxeuBDQ")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //네비게이션 설정
        self.navigationItem.title = "bookrest"
        self.navigationController?.customNavigation()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "house"), style: .done, target: self, action: #selector(homeTapped))
    }
    
    //MARK: - private func
    private func setupUI(){
        titleView.makeShadow()
    }
    private func urlToWebView(_ url: String, title: String){
        let webVC = WebViewController()
        webVC.url = url
        webVC.navigationTItle = title
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    //MARK: - Action Button
    @IBAction func tapServiceLinkBtn(_ sender: UIButton) {
        self.urlToWebView("https://github.com/julia0926", title: "서비스 링크")
        
    }
    
    @IBAction func tapGithubBtn(_ sender: UIButton) {
        self.urlToWebView("https://github.com/julia0926", title: "깃허브 링크")
    }
    
    
    //네비게이션 홈버튼
    @objc func homeTapped(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }

}

