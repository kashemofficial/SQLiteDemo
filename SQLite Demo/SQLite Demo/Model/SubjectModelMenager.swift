//
//  SubjectModelMenager.swift
//  SQLite Demo
//
//  Created by Abul Kashem on 17/1/23.
//

import Foundation
import UIKit

//global
var shareInstanceSubject = SubjectModelMenager()

class SubjectModelMenager {
    var databaseSubject: FMDatabase? = nil
    static func getInstancesSubject() -> SubjectModelMenager {
        if shareInstanceSubject.databaseSubject == nil{
            shareInstanceSubject.databaseSubject = FMDatabase(path: Util.share.getPath(dbName: "StudentSubject.db"))
        }
        return shareInstanceSubject
    }
    
    //MARK: Save Data
    
    func saveSubjectStudent(subjectModel: SubjectModel) -> Bool{
        shareInstanceSubject.databaseSubject?.open()
        let isSave = shareInstanceSubject.databaseSubject?.executeUpdate("INSERT INTO studentSubject (name,subject1,subject2,subject3) VALUES (?,?,?,?)", withArgumentsIn: [subjectModel.names,subjectModel.subject1,subjectModel.subject2,subjectModel.subject3])
        
        shareInstanceSubject.databaseSubject?.close()
        return isSave!
    }
    
    //MARK: Get All Students data
    
    func getAllStudentSubject() -> [SubjectModel] {
        shareInstanceSubject.databaseSubject?.open()
        var studentSubject = [SubjectModel]()
        
        do{
            let resultset : FMResultSet? = try
            shareInstanceSubject.databaseSubject?.executeQuery("SELECT * FROM studentSubject", values: nil)
            
            if resultset != nil{
                while resultset!.next(){
                    let subjectModel = SubjectModel(
                        names: (resultset?.string(forColumn: "name"))!,
                        subject1: (resultset?.string(forColumn: "subject1"))!,
                        subject2: (resultset?.string(forColumn: "subject2"))!,
                        subject3: (resultset?.string(forColumn: "subject3"))!)
                       
                    studentSubject.append(subjectModel)
                }
            }
        }catch {
            
        }
        shareInstanceSubject.databaseSubject?.close()
        return studentSubject
    }
    
    //MARK: Delete StudentSubject Data
    
    func studentSubjectDelete(studentSubject: SubjectModel) -> Bool{
        shareInstanceSubject.databaseSubject?.open()
        let isDeleted = (shareInstanceSubject.databaseSubject?.executeUpdate("DELETE FROM studentSubject WHERE name=?", withArgumentsIn: [studentSubject.names]))
        shareInstanceSubject.databaseSubject?.close()
        return isDeleted!
    }
    
    
}








