//
//  CustomCell.swift
//  personal-info
//
//  Created by Junnosuke Kado on 2018/06/16.
//  Copyright © 2018 Junnosuke Kado. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell{

    var TitleLabels = [UILabel]()
    var DataLabels = [UILabel]()
    var Name = UILabel()
    var titleWidth = 150
    var titleHeight = 20

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(item: Item, row: Int){
        titleHeight = item.fontSize
        titleWidth = item.maxTitlesFontWidth() + 20

        for contentIndex in 0..<item.contentCount {
            var tmplabel = UILabel()
            tmplabel.frame = CGRect(x: titleWidth + 10, y: contentIndex * (titleHeight + 5), width: 200, height: titleHeight)
            tmplabel.text = item.content[contentIndex] + ":" + item.items[row][contentIndex]
            tmplabel.font = UIFont.systemFont(ofSize: CGFloat(titleHeight))

            DataLabels.append(tmplabel)
            self.addSubview(DataLabels[contentIndex])
        }
        Name.frame = CGRect(x: 0, y: Int(self.frame.height)/2 - (titleHeight + 5)/2, width: titleWidth, height: titleHeight)
        Name.text = item.itemtitles[row]
        Name.font = UIFont.systemFont(ofSize: CGFloat(titleHeight))
        Name.textColor = UIColor.white
        Name.backgroundColor = UIColor.gray
        Name.textAlignment = NSTextAlignment.center
        self.addSubview(Name)
    }
}

