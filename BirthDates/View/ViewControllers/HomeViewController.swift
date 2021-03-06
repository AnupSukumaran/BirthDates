//
//  HomeViewController.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import UIKit
import SASCustomAlert

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bdayListView: UITableView!
    @IBOutlet weak var activityIndic: UIActivityIndicatorView!
    var viewModel: HomeViewModel? {
        didSet {
            setHandlers()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bdayListView.delegate = viewModel
        bdayListView.dataSource = viewModel
        activityStartAction(true)
        viewModel?.callBirthdaysAPI()
    }
}

extension HomeViewController {
    func setHandlers() {
        viewModel?.tableReloadHandler = { [weak self] in
            guard let cntr = self else {return}
            cntr.activityStartAction(false)
            cntr.bdayListView.reloadData()
        }
        viewModel?.errorHandler = { [weak self] errStr in
            guard let cntr = self else {return}
            cntr.activityStartAction(false)
            UIAlertController.showAlert(title: .alertMainTitle, message: errStr, buttonTitle: "OK", selfClass: cntr)
        }
        viewModel?.didSelectRowAtIndex = { [weak self] personData in
            guard let cntr = self else {return}
            cntr.showPersonDetailViewController(personDetail: personData)
        }
    }
    func activityStartAction(_ begin: Bool) {
        self.view.isUserInteractionEnabled = !begin
        self.view.alpha = begin ? 0.5 : 1
        guard begin else {
            activityIndic.stopAnimating()
            return
        }
        activityIndic.startAnimating()
    }
}
