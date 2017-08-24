//
//  SQLTable.swift
//  SQLiteDB-iOS
//
//  Created by Fahim Farook on 6/11/15.
//  Copyright © 2015 RookSoft Pte. Ltd. All rights reserved.
//

import UIKit

class SQLTableUnit:NSObject {
	var table = "LearnVernUnit"
	private var data:[String:AnyObject]!
	
	required init(tableName:String) {
		super.init()
		table = tableName
	}
	
	func primaryKey() -> String {
		return "id"
	}
	
	func allRows<T:SQLTableUnit>(order:String="") -> [T] {
		var res = [T]()
		self.data = values()
		let db = SQLiteDB.sharedInstance()
		var sql = "SELECT * FROM \(table)"
		if !order.isEmpty {
			sql += " ORDER BY \(order)"
		}
		let arr = db.query(sql)
		for row in arr {
			let t = T(tableName:table)
			for (key, _) in data {
				let val = row[key]
				t.setValue(val, forKey:key)
			}
			res.append(t)
		}
		return res
	}
    
    func selectAllRowsWhere<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE courseId = '\(strwhere)' AND userId = '\(strUserId)' AND unitType = '\(0)' "
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func selectAllDownloadedRowsWhere<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE courseId = '\(strwhere)' AND userId = '\(strUserId)' AND unitType = '\(0)' AND downloadedStatus = '\(1)' "
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func selectAllRows<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE userId = '\(strUserId)' AND unitType = '\(0)' AND downloadedStatus = '\(1)' "
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func selectDownloadedRowsWhere<T:LearnVernUnit>(strwhere:String="",strCourseId:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE downloadedStatus = '\(strwhere)' AND courseId = '\(strCourseId)' AND userId = '\(strUserId)' AND unitType = '\(0)'"
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func selectRowsWhere<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
      
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE courseId = '\(strwhere)' AND userId = '\(strUserId)' AND unitType = '\(0)' AND downloadedStatus = '\(1)'"
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func selectAllRows<T:LearnVernUnit>(strwhere:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) "
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
	func save() -> (success:Bool, id:Int) {
		assert(!table.isEmpty, "You should define the table name in the sub-class")
		let db = SQLiteDB.sharedInstance()
		let key = primaryKey()
		self.data = values()
		var insert = true
		if let rid = data[key] {
			let sql = "SELECT COUNT(*) AS count FROM \(table) WHERE \(primaryKey())=\(rid)"
			let arr = db.query(sql)
			if arr.count == 1 {
				if let cnt = arr[0]["count"] as? Int {
					insert = (cnt == 0)
				}
			}
		}
		// Insert or update
		let (sql, params) = getSQL(insert)
		let rc = db.execute(sql, parameters:params)
		let res = (rc != 0)
		if !res {
			NSLog("Error saving record!")
		}
		return (res, Int(rc))
	}
    
    func selectRowsWhereVideoIds<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE courseId = '\(strwhere)' AND userId = '\(strUserId)' AND unitType = '\(0)'" // AND videoURL ='\("")'
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func selectRowsWhereVideoURLs<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE courseId = '\(strwhere)' AND userId = '\(strUserId)' AND unitType = '\(0)' AND downloadedStatus = '\(0)'"
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func selectRowsWhereVideoURLForUnit<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE unitId = '\(strwhere)' AND userId = '\(strUserId)' AND unitType != '\(1)' "
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func selectCourseIdWhere<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        
        let sql = "SELECT * FROM \(table) WHERE unitId = '\(strwhere)' AND userId = '\(strUserId)'"
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func updateRowsWhere<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        
        let sql = "UPDATE \(table) SET downloadedStatus = '\(1)' WHERE unitId = '\(strwhere)' AND userId = '\(strUserId)'"

        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func updateUnitStatusWhere<T:LearnVernUnit>(strwhere:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        
        let sql = "UPDATE \(table) SET unitStatus = '\(1)' WHERE unitId = '\(strwhere)' AND userId = '\(strUserId)'"
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }
    
    func updateVideoURL<T:LearnVernUnit>(strwhere:String="",strVideoURL:String="",strUserId:String="") -> [T] {
        
        var res = [T]()
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        
        // jigar remaining update strwhere
        let sql = "UPDATE \(table) SET videoURL = '\(strVideoURL)' WHERE videoId = '\(strwhere)' AND userId = '\(strUserId)'"
        
        let arr = db.query(sql)
        for row in arr {
            let t = T(tableName:table)
            for (key, _) in data {
                let val = row[key]
                t.setValue(val, forKey:key)
            }
            res.append(t)
        }
        return res
    }

    func checkUnitStatus(strwhere:String="",strUserId:String="") -> Bool {
        
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE unitId = '\(strwhere)' AND userId = '\(strUserId)' AND unitStatus = '\(1)'"
        
        let arr = db.query(sql)
        if arr.count == 1{
            return true
        }
        else{
            return false
        }
    }
    
    func checkCourseStatus(strwhere:String="",strUserId:String="") -> Bool {
        
        self.data = values()
        let db = SQLiteDB.sharedInstance()
        let sql = "SELECT * FROM \(table) WHERE courseId = '\(strwhere)' AND userId = '\(strUserId)' AND unitStatus = '\(0)'"
        
        let arr = db.query(sql)
        if arr.count > 0 {
            return true
        }
        else{
            return false
        }
    }
    
//	private func properties() -> [String] {
//		var res = [String]()
//		for c in Mirror(reflecting:self).children {
//			if let name = c.label{
//				res.append(name)
//			}
//		}
//		return res
//	}
	
	private func values() -> [String:AnyObject] {
		var res = [String:AnyObject]()
		let obj = Mirror(reflecting:self)
		for (_, attr) in obj.children.enumerate() {
			if let name = attr.label {
				res[name] = getValue(attr.value as! AnyObject)
			}
		}
		return res
	}
	
	private func getValue(val:AnyObject) -> AnyObject {
		if val is String {
			return val as! String
		} else if val is Int {
			return val as! Int
		} else if val is Float {
			return val as! Float
		} else if val is Double {
			return val as! Double
		} else if val is Bool {
			return val as! Bool
		} else if val is NSDate {
			return val as! NSDate
		}
		return "nAn"
	}
	
	private func getSQL(forInsert:Bool = true) -> (String, [AnyObject]?) {
		var sql = ""
		var params:[AnyObject]? = nil
		if forInsert {
			// INSERT INTO tasks(task, categoryID) VALUES ('\(txtTask.text)', 1)
			sql = "INSERT INTO \(table)("
		} else {
			// UPDATE tasks SET task = ? WHERE categoryID = ?
			sql = "UPDATE \(table) SET "
		}
		let pkey = primaryKey()
		var wsql = ""
		var rid:AnyObject?
		var first = true
		for (key, val) in data {
			// Primary key handling
			if pkey == key {
				if forInsert {
					if val is Int && (val as! Int) == -1 {
						// Do not add this since this is (could be?) an auto-increment value
						continue
					}
				} else {
					// Update - set up WHERE clause
					wsql += " WHERE " + key + " = ?"
					rid = val
					continue
				}
			}
			// Set up parameter array - if we get here, then there are parameters
			if first && params == nil {
				params = [AnyObject]()
			}
			if forInsert {
				sql += first ? key : "," + key
				wsql += first ? " VALUES (?" : ", ?"
				params!.append(val)
			} else {
				sql += first ? key + " = ?" : ", " + key + " = ?"
				params!.append(val)
			}
			first = false
		}
		// Finalize SQL
		if forInsert {
			sql += ")" + wsql + ")"
		} else if params != nil && !wsql.isEmpty {
			sql += wsql
			params!.append(rid!)
		}
		//NSLog("Final SQL: \(sql) with parameters: \(params)")
		return (sql, params)
	}
}
