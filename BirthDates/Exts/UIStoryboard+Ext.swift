//
//  UIStoryboard+Ext.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import Foundation
import UIKit

extension UIStoryboard {
  
    static func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    static func personDetailViewController() -> PersonDetailViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: .personDetailViewController) as? PersonDetailViewController
    }
    
}
