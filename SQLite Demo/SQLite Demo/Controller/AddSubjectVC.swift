//
//  AddSubjectVC.swift
//  SQLite Demo
//
//  Created by Abul Kashem on 17/1/23.
//

import UIKit

class AddSubjectVC: UIViewController {

    @IBOutlet weak var studentNamesTextField: UITextField!
    @IBOutlet weak var subject1TextField: UITextField!
    @IBOutlet weak var subject2TextField: UITextField!
    @IBOutlet weak var subject3TextField: UITextField!
    @IBOutlet weak var totalMarksTextField: UITextField!
    @IBOutlet weak var subjectSaveButton: UIButton!
    var subject : SubjectModel?
    var headerTitles = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if headerTitles != ""{
            self.title = headerTitles
            studentNamesTextField.text = subject?.names
            subject1TextField.text = subject?.subject1
            subject2TextField.text = subject?.subject2
            subject3TextField.text = subject?.subject3
            
        }
        
    }
    
    @IBAction func rightBarButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func subjectSaveButtonAction(_ sender: UIButton) {
        if headerTitles != ""{
            let subject = SubjectModel(names: studentNamesTextField.text!, subject1: subject1TextField.text!, subject2: subject2TextField.text!, subject3: subject3TextField.text!)
            //StudentModel(id: student!.id, name: studentNameTextField.text!, marks: studentMarksTextField.text!)
//            let isUpdate = ModelMenager.getInstance().updateStudent(student: student)
//            print("isUpdate :\(isUpdate)")
        }
        else{
            let subject = SubjectModel(names: studentNamesTextField.text!,subject1: subject1TextField.text!,subject2: subject2TextField.text!,subject3: subject3TextField.text!)
            let isSave = SubjectModelMenager.getInstancesSubject().saveSubjectStudent(subjectModel: subject)
            print("isSave : \(isSave)")
        }
        
    }
    
    
}
