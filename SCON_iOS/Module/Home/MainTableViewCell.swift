//
//  MainTableViewCell.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/22.
//

import UIKit

// 일반화를 해라.. 어떻게?
// 프로토콜 사용한다.
protocol CellProtocol {
    associatedtype DataType
    
    var data: DataType { get }
}


final class MainTableViewCell2: UITableViewCell, CellProtocol {
    var data: ContestYear?
}

final class MainTableViewCell: UITableViewCell, CellProtocol {
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    public var data: ContestList.ContestSort? {
        didSet {
            titleLabel.text = data?.name
//            let image = UIImage(systemName: data?.systemImg)?.withTintColor(data?.imgColor, renderingMode: .alwaysOriginal)
//            imgView.image = image
        }
    }
}
