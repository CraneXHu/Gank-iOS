//
//  GankTabBarController.swift
//  gank
//
//  Created by huhexiang on 16/12/10.
//  Copyright © 2016年 huhexiang. All rights reserved.
//

import UIKit

class GankTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for (_, viewController) in self.viewControllers!.enumerated(){
            let image = UIImage(named: "second");
            viewController.tabBarItem = UITabBarItem(title:"test", image: image, selectedImage: image);
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
