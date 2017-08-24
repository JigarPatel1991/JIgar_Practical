//
//  LearnVern.swift
//  LearnVern
//
//  Created by Tops on 9/8/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

class LearnVern: SQLTable {
    
    var id = -1
    var videoId = ""
    var name = ""
    var strCourseId = ""
    
    init() {
        super.init(tableName:"LearnVernVideo")
    }
    
    required convenience init(tableName:String) {
        self.init()
    }
}
