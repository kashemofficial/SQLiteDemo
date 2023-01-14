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
    
    //MARK: Fetching Student Data
    
    func getAllStudent() -> [StudentModel] {
        shareInstance.database?.open()
        var students = [StudentModel]()

        do{
            let resultset : FMResultSet? = try
            shareInstance.database?.executeQuery("SELECT  * FROM  student", values: nil)

            if resultset != nil{
                while resultset!.next(){
                    let studentModel = StudentModel(id: (resultset?.string(forColumn: "id"))!, name: (resultset?.string(forColumn: "name"))!, marks: (resultset?.string(forColumn: "marks"))!)
                    students.append(studentModel)
                }
            }
        }catch {
            
        }
        shareInstance.database?.close()
        return students
    }
    
    
    
}

