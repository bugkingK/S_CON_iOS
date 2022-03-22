//
//  LaunchingViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/22.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {

    @IBOutlet weak var lottieView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - Lottie View
        let animationView = AnimationView(name: "mainLottie")
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        animationView.play()
    }
    
    
    


}
