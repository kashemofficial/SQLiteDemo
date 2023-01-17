//
//  ViewController.swift
//  SQLite Demo
//
//  Created by Abul Kashem on 13/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    
    var allStudent = [StudentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        allStudent = ModelMenager.getInstance().getAllStudent()
        
        studentTableView.reloadData()
    }
    
    
    @IBAction func leftBarButtonAction(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StudentSubjectVC") as! StudentSubjectVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func rightBarButtonAction(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddStudentViewController") as! AddStudentViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpTableView(){
        let nib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        studentTableView.register(nib, forCellReuseIdentifier: "cell")
        studentTableView.delegate = self
        studentTableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StudentTableViewCell
        cell.nameLabel.text = allStudent[indexPath.row].name
        cell.marksLabel.text = allStudent[indexPath.row].marks
        cell.idLabel.text = allStudent[indexPath.row].id
        cell.editButton.tag = indexPath.row
        cell.deleteButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(onClickEdit(_:)), for: .touchUpInside)
        cell.deleteButton.addTarget(self, action: #selector(onClickDelete(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func onClickEdit(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddStudentViewController") as! AddStudentViewController
        vc.student = allStudent[sender.tag]
        vc.headerTitle = "Update"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onClickDelete(_ sender: UIButton){
        let isDeleted = ModelMenager.getInstance().deleteStudent(student: allStudent[sender.tag])
        allStudent.remove(at: sender.tag)
        studentTableView.reloadData()
        print("isDeleted : \(isDeleted)")
    }
    
}
