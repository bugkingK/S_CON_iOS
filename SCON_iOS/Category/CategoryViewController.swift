//
//  CategoryViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/23.
//

import UIKit
import Tabman
import Pageboy

class CategoryViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    let years = ["2021", "2020", "2019"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TwenyOneViewController") as! TwenyOneViewController
        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TwentyViewController") as! TwentyViewController
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NineteenViewController") as! NineteenViewController
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        
        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20.0, bottom: 0.0, right: 20.0)
        bar.backgroundView.style = .blur(style: .regular) //투명해짐
        bar.indicator.overscrollBehavior = .bounce //인디케이터 설정
        bar.layout.contentMode = .fit //탭바의 크기에 맞춰서

        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }

}
//MARK: - TabmanVC- DataSource
extension CategoryViewController: PageboyViewControllerDataSource, TMBarDataSource{
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
            let item = TMBarItem(title: "")
            item.title = years[index]
            return item
        }
        
        func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
            return viewControllers.count
        }

        func viewController(for pageboyViewController: PageboyViewController,
                            at index: PageboyViewController.PageIndex) -> UIViewController? {
            return viewControllers[index]
        }

        func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
            return nil
        }
    
}
