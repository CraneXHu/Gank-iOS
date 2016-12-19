//
//  GankTableViewCellWithoutImage.swift
//  gank
//
//  Created by huhexiang on 16/12/12.
//  Copyright © 2016年 huhexiang. All rights reserved.
//

import UIKit

class GankTableViewCellWithoutImage: UITableViewCell {
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var who: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
