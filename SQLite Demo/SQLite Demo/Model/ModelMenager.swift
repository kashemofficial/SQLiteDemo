//
//  ModelMenager.swift
//  SQLite Demo
//
//  Created by Abul Kashem on 14/1/23.
//

import Foundation
import UIKit

//global
var shareInstance = ModelMenager()

class ModelMenager {
    var database: FMDatabase? = nil
    
    static func getInstance() -> ModelMenager {
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "SqliteDemo.db"))
        }
        return shareInstance
    }
    
    //MARK: Save Student Data
    
    func SaveStudent(studentModel: StudentModel) -> Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO student (name, marks) VALUES(?,?)", withArgumentsIn: [studentModel.name, studentModel.marks])
        shareInstance.database?.close()
        return isSave!
    }
    
    
    
    
}

