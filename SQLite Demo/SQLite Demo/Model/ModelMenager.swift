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
    
    //MARK: Get All Students data
    
    func getAllStudent() -> [StudentModel] {
        shareInstance.database?.open()
        var students = [StudentModel]()

        do{
            let resultset : FMResultSet? = try
            shareInstance.database?.executeQuery("SELECT * FROM student", values: nil)

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
    
    //MARK: Update Students data
    
    func updateStudent(student: StudentModel) -> Bool{
        shareInstance.database?.open()
        let isUpdate = shareInstance.database?.executeUpdate("UPDATE student SET name=?, marks=? WHERE id=? ", withArgumentsIn: [student.name,student.marks,student.id])
        shareInstance.database?.close()
        return isUpdate!
    }
    
    //MARK: Delete Student Data
    
    func deleteStudent(student: StudentModel) -> Bool{
        shareInstance.database?.open()
        let isDeleted = (shareInstance.database?.executeUpdate("DELETE FROM student WHERE name=?", withArgumentsIn: [student.name]))
        shareInstance.database?.close()
        return isDeleted!
    }
    
}

