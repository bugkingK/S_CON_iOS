//
//  AwardCollectionViewCell.swift
//  SKCON_iOS
//
//  Created by 김지인 on 2022/03/19.
//

import UIKit

class AwardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.contentView.layer.cornerRadius = 10
    }
}
