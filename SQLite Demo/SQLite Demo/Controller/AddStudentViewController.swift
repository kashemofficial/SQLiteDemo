//
//  AddStudentViewController.swift
//  SQLite Demo
//
//  Created by Abul Kashem on 14/1/23.
//

import UIKit

class AddStudentViewController: UIViewController {
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentMarksTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func leftBarButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        let student = StudentModel(id: "", name: studentNameTextField.text!, marks: studentMarksTextField.text!)
        
        let isSave = ModelMenager.getInstance().SaveStudent(studentModel: student)
        
    }
    

}