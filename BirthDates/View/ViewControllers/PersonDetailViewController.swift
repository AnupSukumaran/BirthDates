//
//  PersonDetailViewController.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var initialsView: UIView!
    @IBOutlet weak var lbInitials: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDob: UILabel!
    @IBOutlet weak var goBackBtn: UIButton!
    var viewModel: PersonDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurves()
        setValues()
    }
    @IBAction func goBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension PersonDetailViewController {
    func setCurves() {
        goBackBtn.layer.cornerRadius = 12
        initialsView.layer.cornerRadius = 64
    }
    func setValues() {
        lbInitials.text = viewModel?.personDetail?.name.getInitials()
        lbName.text = viewModel?.personDetail?.name
        lbDob.text = viewModel?.personDetail?.dateOfBirth.ageValue()
    }
}
