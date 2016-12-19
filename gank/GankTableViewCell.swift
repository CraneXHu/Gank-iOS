//
//  GankTableViewCell.swift
//  gank
//
//  Created by huhexiang on 16/12/11.
//  Copyright © 2016年 huhexiang. All rights reserved.
//

import UIKit

class GankTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
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
