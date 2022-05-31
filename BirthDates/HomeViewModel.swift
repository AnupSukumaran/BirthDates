//
//  HomeViewModel.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import UIKit

class HomeViewModel: NSObject {
    var personsArr = [BirthdaysQuery.Data.Person]()
    var tableReloadHandler: (() -> Void)?
    var errorHandler: ((String) -> Void)?
}

extension HomeViewModel {
    func callBirthdaysAPI() {
        NetworkLib.shared.callBirthdaysAPI { result in
            switch result {
            case .success(let personArrData):
                DispatchQueue.main.async {
                    self.personsArr = personArrData
                    self.tableReloadHandler?()
                }
            case .failure(let err, _):
                self.errorHandler?(err)
            }
        }
    }
}
