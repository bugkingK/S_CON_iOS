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
    
    var navTitle: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeView.load(withVideoId: "VpKfXxeuBDQ")
        //네비게이션 설정
        self.navigationItem.title = navTitle
        self.navigationController?.customNavigation()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "house"), style: .done, target: self, action: #selector(homeTapped))
        //titleView 배경 지정
        titleView.makeShadow()

    }
    
    @objc func homeTapped(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }

}

