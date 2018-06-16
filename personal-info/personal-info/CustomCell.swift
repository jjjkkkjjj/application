//
//  CustomCell.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/16.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell{

    var contentTitleLabels = [UILabel]()
    var contentDataLabels = [UILabel]()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(item: Item, row: Int){
        let fontSize = item.fontSize
        for (index, contentTitle) in item.content.enumerated(){
            var tmplabel = UILabel()
            tmplabel.frame = CGRect(x:0, y:index*(fontSize + 5), width: 300, height: (fontSize + 5))
            tmplabel.text = contentTitle
            tmplabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
            contentTitleLabels.append(tmplabel)
            self.addSubview(contentTitleLabels[index])
        }
    }
}

