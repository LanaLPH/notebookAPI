//
//  ViewController.swift
//  demoWebService
//
//  Created by Lana Hoang on 2018-09-13.
//  Copyright © 2018 Lana Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNote: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSave(_ sender: Any) {
        let textdata = txtNote.text
        let url = URL (string: "http://localhost:3000/api/notes/create")
        var req = URLRequest (url:url!)
        req.httpMethod = "POST"
        
        req.httpBody = "t=\(textdata!)".data(using: .utf8)
        
        URLSession.shared.dataTask(with: req, completionHandler: { (data, res, err) in
            print(  String(data: data!, encoding: .utf8)! )
            print("'success!!!'")
        }).resume()
    }
     
}

