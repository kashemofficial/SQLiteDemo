//
//  SubjectTableViewCell.swift
//  SQLite Demo
//
//  Created by Abul Kashem on 17/1/23.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var subject1Label: UILabel!
    @IBOutlet weak var subject2Label: UILabel!
    @IBOutlet weak var subject3Label: UILabel!
    @IBOutlet weak var subjectDeleteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
