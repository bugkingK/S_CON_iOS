//
//  DefaultLoginViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/04/05.
//

import UIKit

class DefaultLoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMsgLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //next 버튼 설정
        nextButton.makeCircleAndbgColor(bgColor: .yellow)
        nextButton.isEnabled = false
    }
    

    @IBAction func tappedNextBtn(_ sender: UIButton) {
        
    }
    

}

