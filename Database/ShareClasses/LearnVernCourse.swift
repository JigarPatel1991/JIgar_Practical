//
//  LearnVernCourse.swift
//  LearnVernCourse
//
//  Created by Tops on 9/8/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

class LearnVernCourse: SQLTableCourse {
    
    var id = -1
    var userId = ""
    var courseId = ""
    var courseName = ""
    var courseReviewStatus = 0
    var courseDownloadStatus = 0
    
    init() {
        super.init(tableName:"LearnVernCourse")
    }
    
    required convenience init(tableName:String) {
        self.init()
    }
}
