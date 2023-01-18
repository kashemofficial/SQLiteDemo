//
//  StudentSubjectVC.swift
//  SQLite Demo
//
//  Created by Abul Kashem on 17/1/23.
//

import UIKit

class StudentSubjectVC: UIViewController {

    @IBOutlet weak var subjectTableView: UITableView!
    var subjectAllStudent = [SubjectModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subjectAllStudent = SubjectModelMenager.getInstancesSubject().getAllStudentSubject()
        subjectTableView.reloadData()
    }
    
    @IBAction func leftBarButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rightBarButtonAction(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddSubjectVC") as! AddSubjectVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupTableView(){
        let nib = UINib(nibName: "SubjectTableViewCell", bundle: nil)
        subjectTableView.register(nib, forCellReuseIdentifier: "SubjectTableViewCell")
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
    }

}

extension StudentSubjectVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectAllStudent.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectTableViewCell") as! SubjectTableViewCell
        cell.studentNameLabel.text = subjectAllStudent[indexPath.row].names
        cell.subject1Label.text = subjectAllStudent[indexPath.row].subject1
        cell.subject2Label.text = subjectAllStudent[indexPath.row].subject2
        cell.subject3Label.text = subjectAllStudent[indexPath.row].subject3
        cell.subjectDeleteButton.addTarget(self, action: #selector(onClickDelet(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func onClickDelet(_ sender: UIButton){
        let isDeleted = SubjectModelMenager.getInstancesSubject().studentSubjectDelete(studentSubject: subjectAllStudent[sender.tag])
        subjectAllStudent.remove(at: sender.tag)
        subjectTableView.reloadData()
        print("isDeleted : \(isDeleted)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
}
