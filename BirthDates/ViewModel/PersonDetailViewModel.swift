//
//  PersonDetailViewModel.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import UIKit

class PersonDetailViewModel: NSObject {
    var personDetail: BirthdaysQuery.Data.Person?
    override init() {}
    init(personDetail: BirthdaysQuery.Data.Person?) {
        self.personDetail = personDetail
    }
}
