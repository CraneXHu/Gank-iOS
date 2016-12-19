//
//  WebViewController.swift
//  gank
//
//  Created by huhexiang on 16/12/12.
//  Copyright © 2016年 huhexiang. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var gankData: GankData!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.backgroundColor = UIColor.white
        webView.isOpaque = true
        let url = NSURL(string: gankData.url)
        let request = NSURLRequest(url: url! as URL)
        webView.loadRequest(request as URLRequest)
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
