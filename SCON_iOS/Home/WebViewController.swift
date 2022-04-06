//
//  WebViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/31.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    var url: String = ""
    var navigationTItle: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.customNavigation()
//        self.navigationItem.title = navigationTItle
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    

}
