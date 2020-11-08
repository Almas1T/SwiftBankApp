//
//  main.swift
//  BankAppSwift
//
//  Created by Almas Tai on 2020-10-28.
//

import Foundation

var cusList = [Customer]()
var bk = Bank(adminid: "admin", adminPass: "admin")

var folder = try? Folder(path: "/Users/almas/Desktop/Swift/BankAppSwift")

func scanAcDetails() -> Void {
    
}

func scanCustomerDetails() -> Void {
    print("Enter Customer name:")
    let name = readLine()!
    print("Enter Customer id:")
    let customerid = readLine()!
    print("Enter Customer Password:")
    let customerPass = readLine()!
    print("Enter opening balance greater than 0")
    let balance = Double(readLine()!)!
    let x = Int.random(in: 100...200)
    let accountNo = name.prefix(3) + String(x)
    print("Your A/C number is \(accountNo)")
    cusList.append(Customer(name: name, customerid: customerid, customerPass: customerPass, accountNo: String(accountNo), balance: balance))
    let folder = try? Folder(path: "/Users/almas/Desktop/Swift/BankAppSwift")
    
    let file = try? folder?.createFile(named: "\(accountNo)")
    
    try? file?.write("\(accountNo),\(name),\(customerid),\(customerPass),\(balance)")
    
}


while true{
    var n,n1,n2,n3 : Int
    var rep = true
    
    print("Bank Application")
    print("1. Admin Login \n2. Customer Login \n3. Exit")
    n = Int(readLine()!)!
    switch n {
    case 1:
        print("Admin Login")
        print("Enter Admin Username : ")
        var username = readLine()!
        print("Enter the Admin Password")
        var password = readLine()!
        
        if username == bk.adminid && password == bk.adminPass{
            while rep{
                print("Admin Access")
                print("1. Create New User \n2. Display User Details \n3. Go to Main Menu")
                n1 = Int(readLine()!)!
                switch n1 {
                case 1:
                    scanCustomerDetails()
                case 2:
                    print("Enter User Account Number")
                    let acNo = readLine()!
                    for c in cusList {
                        if acNo == c.accountNo{
                            c.dispalyAcDetails()
                        }
                    }
                case 3:
                    rep = false
                    break
                default:
                    break
                }
            }
        }
        else{
            print("Invalid Username or Password!")
        }
    case 2:
        print("Customer Login")
        print("Enter Account Number")
        let acN = readLine()!
        print("Enter Customer Id")
        let cusId = readLine()!
        print("Enter Username")
        let userName = readLine()!
        print("Enter Password")
        let pass = readLine()!
        var check = false
        let isfile = folder?.containsFile(named: "\(acN)")
        if isfile! {
            for c in cusList {
                if acN == c.accountNo {
                   check = c.checkCustomer(customerid: cusId, CustomerPass: pass, accountNo: acN)
                }
            }
        }
        else{
            print("Invalid Details")
        }
        if check{
            for c in cusList {
                if acN == c.accountNo {
                    c.dispalyCustomerDetails(accountNo: acN)
                    rep = true
                    while rep{
                        print("Customer Access")
                        print("1. Account Details \n2. Withdraw Money \n3. Deposit Money \n4. Transfer Money \n5. Pay Bill \n6. Go to Main Menu")
                        n2 = Int(readLine()!)!
                        switch n2 {
                        case 1:
                            c.dispalyCustomerDetails(accountNo: acN)
                            break
                        case 2:
                            c.withdrawl()
                            break
                        case 3:
                            c.deposit()
                            break
                        case 4:
                            c.transfer()
                            break
                        case 5:
                            c.payment()
                            break
                        case 6:
                            rep = false
                            break
                        default:
                            break
                        }
                    }
                }
            }
        }
    default:
        break
    }
}
