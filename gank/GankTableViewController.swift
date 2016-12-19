//
//  GankTableViewController.swift
//  gank
//
//  Created by huhexiang on 16/12/11.
//  Copyright © 2016年 huhexiang. All rights reserved.
//

import UIKit

class GankTableViewController: UITableViewController {

    var gankDatas = [GankData]()
    var dataSource = "Android"
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadData()
    }
    
    func loadData(){
        let manager = AFHTTPSessionManager(baseURL: NSURL(string: "http://gank.io") as? URL)
        
        let url = "/api/data/\(dataSource)/10/\(currentPage)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)
        manager.get(url!, parameters: nil, progress: nil, success: {(task: URLSessionDataTask, responseObject: Any?)-> Void in
            let result: Dictionary<String, Any> = (responseObject as? Dictionary<String, Any>)!
            let dataArray: Array<Dictionary<String, Any>> = result["results"] as! Array<Dictionary<String, Any>>;
            for data in dataArray {
                let url = data["url"] as? String
                let images = data["images"] as? Array<String>
                let desc = data["desc"] as? String
                let who = data["who"] as? String
                let time = data["publishedAt"] as? String
                let formatTime = self.timeFormat(time: time!)
                let gankData = GankData(url: url!, imageUrl: images?[0], desc: desc!, who: who, time: formatTime)
                self.gankDatas.append(gankData)
            }
            self.tableView.reloadData()
        }, failure: {(task: URLSessionDataTask?, error: Error)-> Void in
        print(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gankDatas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == (currentPage*10 - 2){
            currentPage += 1
            loadData()
        }
        
        let gankData = gankDatas[indexPath.row]
        if gankData.imageUrl == nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GankTableViewCellWithoutImage", for: indexPath) as! GankTableViewCellWithoutImage
            cell.desc.text = gankData.desc
            cell.who.text = gankData.who
            cell.time.text = gankData.time
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GankTableViewCell", for: indexPath) as! GankTableViewCell
            
            cell.photoImageView.setImageWith(NSURL(string: gankData.imageUrl!) as! URL)
            cell.desc.text = gankData.desc
            cell.who.text = gankData.who
            cell.time.text = gankData.time
            return cell
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let webViewController = segue.destination as! WebViewController
        
        // Get the cell that generated this segue.
        if let selectedGankCell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: selectedGankCell)!
            let selectedGankData = gankDatas[indexPath.row]
            webViewController.gankData = selectedGankData
        }

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let gankData = gankDatas[indexPath.row]
        if gankData.imageUrl == nil {
            return 66
        } else {
            return 232
        }
    }
 

    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        
        currentPage = 1
        gankDatas.removeAll()
        
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            dataSource = "Android"
        case 1:
            dataSource = "iOS"
        default:
            dataSource = "前端"
        }
        loadData()
    }
    
    func timeFormat(time : String) -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = df.date(from: time)
        df.dateFormat="yyyy-MM-dd"
        df.string(from: date!)
        return df.string(from: date! as Date)
    }
}
