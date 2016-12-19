//
//  GankData.swift
//  gank
//
//  Created by huhexiang on 16/12/11.
//  Copyright © 2016年 huhexiang. All rights reserved.
//

import UIKit

class GankData: NSObject {

    var url: String
    var imageUrl: String?
    var desc: String
    var who: String?
    var time: String
    
    init(url: String, imageUrl: String?, desc: String, who: String?, time: String) {
        self.url = url
        self.imageUrl = imageUrl
        self.desc = desc
        self.who = who
        self.time = time
        
        super.init()
    }
}
