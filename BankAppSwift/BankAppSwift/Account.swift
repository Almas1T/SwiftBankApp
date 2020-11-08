//
//  Account.swift
//  BankAppSwift
//
//  Created by Almas Tai on 2020-10-30.
//

import Foundation

class Account {
    var accountNo : String
    var balance : Double
    var amt : Double = 0.0
    
    init(accountNo : String, balance : Double) {
        self.accountNo = accountNo
        self.balance = balance
    }
    
    func dispalyAcDetails() -> Void {
        print("\(self.accountNo)  |  \(self.balance)")
    }
    
    func deposit() -> Void {
        print("your A/C balance is \(self.balance)")
        print("Enter amount to be deposited : ")
        amt = Double(readLine()!)!
        if amt < 0{
            print("negative value of amount is entered so cant deposit")
        }
        else{
            self.balance += amt
            print("Deposit Successful ! Final balance : \(self.balance)")
          
        }
    }
    
    func withdrawl() -> Void {
        print("your A/C balance is \(self.balance)")
        print("Enter amount to be withdrawn : ")
        amt = Double(readLine()!)!
        if self.balance - amt < 0{
            print("Not Sufficient balance")
        }
        else if amt < 0{
            print("improper amount witdrawl is requested! Enter proper amount")
        }
        else{
            self.balance -= amt
            print("withdrawl Successful ! Final balance : \(self.balance)")
        }
    }
    
    func transfer() -> Void{
        print("your A/C balance is \(self.balance)")
        print("Enter amount to Tansfer: ")
        amt = Double(readLine()!)!
        if self.balance - amt < 0{
            print("Not Sufficient balance")
        }
        else if amt < 0{
            print("improper amount Transfer is requested! Enter proper amount")
        }
        else{
            self.balance -= amt
            print("Transfer Successful ! Final balance : \(self.balance)")
        }
    }
    
    func payment() -> Void {
        print("your A/C balance is \(self.balance)")
        print("Enter amount to be payed : ")
        amt = Double(readLine()!)!
        if self.balance - amt < 0{
            print("Not Sufficient balance")
        }
        else if amt < 0{
            print("improper amount pay is requested! Enter proper amount")
        }
        else{
            self.balance -= amt
            print("Payment Successful ! Final balance : \(self.balance)")
            
        }
        
    }
    
}
