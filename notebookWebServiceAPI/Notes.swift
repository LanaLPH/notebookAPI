//
//  Notes.swift
//  demoWebService
//
//  Created by Lana Hoang on 2018-09-13.
//  Copyright © 2018 Lana Hoang. All rights reserved.
//

import Foundation
 
class Notes  {
    var id : Int
    var t: String
    var d: String
    
    init(i:Int, t:String, d:String) {
        self.id = i
        self.t = t
        self.d = d
    }
}
