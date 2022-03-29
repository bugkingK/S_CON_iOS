//
//  Content.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/29.
//

import UIKit

struct Content {
    let setionName: String
    let contentItem: [Item]
}


struct Item {
    let description: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName) ?? UIImage()
    }
}
