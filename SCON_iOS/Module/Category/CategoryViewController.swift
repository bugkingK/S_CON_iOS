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
    
    var teamData = [ContestData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "수상작들"
        self.navigationController?.customNavigation()
        self.createTabBar() //하단 탭바
        print("TeamData \(teamData)")
        //MARK: - 상단 Tabbar
        let storyboard = UIStoryboard.init(name: "Category", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "TwenyOneViewController") as! Cate2021ViewController
        let vc2 = storyboard.instantiateViewController(withIdentifier: "TwentyViewController") as! Cate2020ViewController
        let vc3 = storyboard.instantiateViewController(withIdentifier: "NineteenViewController") as! Cate2019ViewController
        
        
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        
        self.dataSource = self
        
        

    }
    
    // Create Tabbar
    private func createTabBar() {
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10.0, right: 10)
        bar.backgroundView.style = .blur(style: .regular) //투명해짐
        bar.indicator.overscrollBehavior = .bounce //인디케이터 설정
        bar.layout.contentMode = .fit //탭바의 크기에 맞춰서
        //인디케이터 조정
        bar.indicator.weight = .light
        bar.indicator.overscrollBehavior = .compress
        bar.indicator.tintColor = UIColor(named: "darkYellow")
        bar.buttons.customize { button in
            button.tintColor = .darkGray
            button.selectedTintColor = UIColor(named: "darkYellow")
        }
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
