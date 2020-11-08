//
//  Bank.swift
//  BankAppSwift
//
//  Created by Almas Tai on 2020-10-28.
//

import Foundation

class Bank{
    var customercount = 0
    var adminid : String
    var adminPass : String
    
    init(adminid : String, adminPass : String) {
        self.adminid = "admin"
        self.adminPass = "admin"
    }
}
