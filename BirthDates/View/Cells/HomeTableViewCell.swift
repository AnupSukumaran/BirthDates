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
        profileView.layer.cornerRadius = 27.5
    }
    
    func config(person: BirthdaysQuery.Data.Person){
        lbFirstLetter.text = person.name.getInitials()
        lbNames.text = person.name
        lbDOB.text = person.dateOfBirth.convertDateFormate()
    }

}
