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
        //델리겟 연결
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder() //첫번째 커서가 이메일 입력폼
        
    }
    //화면 터치시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func tappedNextBtn(_ sender: UIButton) {
        
    }
    

}


extension DefaultLoginViewController: UITextFieldDelegate{
    //입력이 완료 되면 키보드 내림 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
