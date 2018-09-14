//
//  TableTableViewController.swift
//  demoWebService
//
//  Created by Lana Hoang on 2018-09-13.
//  Copyright © 2018 Lana Hoang. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {

    var arrNotes:[Notes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let url = URL (string: "http://localhost:3000/api/notes/show")
        var req = URLRequest (url:url!)
        req.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: req, completionHandler: { (data, res, err) in
            print(  String(data: data!, encoding: .utf8)! )
            print("'success!!!'")
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                
                if(json["result"]) as! Int == 1
                {
                    let rows = json["notes"] as! [AnyObject]
                    
                    //clear table after add new item
                    self.arrNotes.removeAll()
                    
                    for row in rows {
                        self.arrNotes.append(Notes(i:row["id"] as! Int,
                                                   t:row["text"] as! String,
                                                   d:row["updatedAt"] as! String))
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                }
            }catch{
                print("read json err ")
            }
        }).resume()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = arrNotes[indexPath.row].t
        cell?.detailTextLabel?.text = arrNotes[indexPath.row].d
        return cell!
    } 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotes.count
    }
}



















