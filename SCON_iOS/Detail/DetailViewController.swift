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
    
    var navTitle: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeView.load(withVideoId: "SjOMPEmnl3Y")
        //네비게이션 설정
        self.navigationItem.title = navTitle
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.left.2.circle"), style: .done, target: self, action: #selector(homeTapped))
    }
    
    @objc func homeTapped(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }

    


}
