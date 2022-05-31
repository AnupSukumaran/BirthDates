//
//  HomeViewController.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import UIKit

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
            guard let vc = self else {return}
            vc.activityStartAction(false)
            vc.bdayListView.reloadData()
        }
        
        viewModel?.errorHandler = { [weak self] errStr in
            guard let vc = self else {return}
            vc.activityStartAction(false)
        }
        
        viewModel?.didSelectRowAtIndex = { personData in

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
