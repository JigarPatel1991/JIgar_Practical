//
//  LearnVernUnit.swift
//  LearnVernUnit
//
//  Created by Tops on 9/8/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

class LearnVernUnit: SQLTableUnit {
    
    var id = -1
    var userId = ""
    var courseId = ""
    var unitId = ""
    var unitName = ""
    var unitStatus = 0
    var unitType = 0
    var downloadedStatus = 0
    var videoId = ""
    var videoURL = ""
    
    init() {
        super.init(tableName:"LearnVernUnit")
    }
    
    required convenience init(tableName:String) {
        self.init()
    }
}
