//
//  UIViewController+Ext.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func navPush(_ controller: UIViewController, title: String = "") {
       navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
       controller.navigationItem.setHidesBackButton(true, animated: true)
       navigationController?.pushViewController(controller, animated: true)
    }
    func showPersonDetailViewController(personDetail: BirthdaysQuery.Data.Person?) {
        guard let cntr = UIStoryboard.personDetailViewController() else {return}
        cntr.viewModel = PersonDetailViewModel(personDetail: personDetail)
        navPush(cntr)
    }
}
