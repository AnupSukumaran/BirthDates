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
        // Do any additional setup after loading the view.
    }


}

extension HomeViewController {
    
    func setHandlers() {
        
        viewModel?.tableReloadHandler = { [weak self] in
            guard let vc = self else {return}
            vc.bdayListView.reloadData()
        }
        
        viewModel?.errorHandler = { [weak self] errStr in
//            guard let vc = self else {return}
        }
    }
    
}
