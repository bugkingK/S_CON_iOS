//
//  DetailViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/25.
//

import UIKit
import youtube_ios_player_helper

class DetailViewController: UIViewController {
    
    //View
    @IBOutlet weak var youtubeView: YTPlayerView!
    @IBOutlet weak var titleView: UIView!
    //메인 뷰 아울렛
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var prizeInfoLabel: UILabel!
    
    
    var navTitle: String?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = navTitle
        self.navigationController?.customNavigation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeView.load(withVideoId: "VpKfXxeuBDQ")
        //네비게이션 설정
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "house"), style: .done, target: self, action: #selector(homeTapped))
        //titleView 배경 지정
        titleView.makeShadow()

    }
    
    @objc func homeTapped(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func urlToWebView(_ url: String, title: String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let webVC = storyboard.instantiateViewController(withIdentifier: "webVC") as? WebViewController else { return }
        webVC.url = url
        webVC.navigationTItle = title
        self.navigationController?.pushViewController(webVC, animated: true)
    }

    @IBAction func TappedGithubBtn(_ sender: UIButton) {
        self.urlToWebView("https://github.com/julia0926", title: "")
    }
}

