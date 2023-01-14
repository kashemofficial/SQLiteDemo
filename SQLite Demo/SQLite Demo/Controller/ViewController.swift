//
//  ViewController.swift
//  SQLite Demo
//
//  Created by Abul Kashem on 13/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StudentTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
