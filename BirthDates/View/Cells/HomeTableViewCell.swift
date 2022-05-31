//
//  HomeTableViewCell.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var lbFirstLetter: UILabel!
    @IBOutlet weak var lbNames: UILabel!
    @IBOutlet weak var lbDOB: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(person: BirthdaysQuery.Data.Person){
        lbFirstLetter.text = person.name.getInitials()
        lbNames.text = person.name
        lbDOB.text = person.dateOfBirth.convertDateFormate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
