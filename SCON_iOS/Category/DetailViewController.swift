//
//  DetailViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/25.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.left.2.circle"), style: .done, target: self, action: #selector(homeTapped))
    }
    
    @objc func homeTapped(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }

    


}
