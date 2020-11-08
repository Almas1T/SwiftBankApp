//
//  Customer.swift
//  BankAppSwift
//
//  Created by Almas Tai on 2020-10-30.
//

import Foundation

class Customer : Account{
    var name = ""
    var customerid = ""
    var customerPass = ""
    
    init(name : String, customerid : String, customerPass : String, accountNo : String, balance : Double) {
        self.name = name
        self.customerid = customerid
        self.customerPass = customerPass
        super.init(accountNo: accountNo, balance: balance)
    }
    
    
    
    func dispalyCustomerDetails(accountNo : String) -> Void {
        let folder = try? Folder(path: "/Users/almas/Desktop/Swift/BankAppSwift")
        
        let file = try? folder?.createFileIfNeeded(withName: "\(accountNo)")
        
        let data = try? file?.readAsString()
        let lines = data!.split(whereSeparator: \.isNewline)
        for line in lines{
            //split each line into words which are fields
            let fields = line.components(separatedBy: ",")
            //create an object of Product assuming the seprated words are the inputs
             print("Account No:\(fields[0]),Name:\(fields[1]),Customerid:\(fields[2]),customer Password:\(fields[3]),Balance:\(fields[4])")
        
        }
    }
    
    func checkCustomer(customerid : String, CustomerPass : String, accountNo : String) -> Bool {
        let folder = try? Folder(path: "/Users/almas/Desktop/Swift/BankAppSwift")
        
        let file = try? folder?.createFileIfNeeded(withName: "\(accountNo)")
        
        let data = try? file?.readAsString()
        let lines = data!.split(whereSeparator: \.isNewline)
        for line in lines{
            //split each line into words which are fields
            let fields = line.components(separatedBy: ",")
            if fields[2] == customerid && fields[3] == CustomerPass{
            return true
            }
        }
        return false
    }
}

