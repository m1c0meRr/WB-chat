import Foundation

struct BankAccount {
    let number: String
    var balance: Double

    mutating func deposit(amount: Double) {
        balance += amount
    }

    mutating func withdraw(amount: Double) {
        balance -= amount
    }
}

class Bank {
    var accounts: [String: BankAccount] = [:]
    
    func addAccount(account: BankAccount) {
        accounts[account.number] = account
    }

    func deposit(accountNumber: String, amount: Double) {
        guard var account = accounts[accountNumber] else {
            print("Account not found")
            return
        }
        print("Before deposit: Account \(accountNumber): \(account.balance)")
        account.deposit(amount: amount)
        accounts[accountNumber] = account
        print("After deposit: Account \(accountNumber): \(account.balance)")
    }

    func withdraw(accountNumber: String, amount: Double) {
        guard var account = accounts[accountNumber] else {
            print("Account not found")
            return
        }
        print("Before withdraw: Account \(accountNumber): \(account.balance)")
        guard account.balance >= amount else {
            print("Insufficient funds")
            return
        }
        account.withdraw(amount: amount)
        accounts[accountNumber] = account
        print("After withdraw: Account \(accountNumber): \(account.balance)")
    }

    func transfer(fromAccountNumber: String, toAccountNumber: String, amount: Double) {
        guard var fromAccount = accounts[fromAccountNumber], var toAccount = accounts[toAccountNumber] else {
            print("One or both accounts not found")
            return
        }
        print("Before transfer: Account \(fromAccountNumber): \(fromAccount.balance), Account \(toAccountNumber): \(toAccount.balance)")
        guard fromAccount.balance >= amount else {
            print("Insufficient funds")
            return
        }
        fromAccount.withdraw(amount: amount)
        toAccount.deposit(amount: amount)
        accounts[fromAccountNumber] = fromAccount
        accounts[toAccountNumber] = toAccount
        print("After transfer: Account \(fromAccountNumber): \(fromAccount.balance), Account \(toAccountNumber): \(toAccount.balance)")
    }
    
    func printAccounts() {
        for account in accounts.values {
            print("Account \(account.number): \(account.balance)")
        }
    }
}



let bank = Bank()

let account1 = BankAccount(number: "1", balance: 1000)
let account2 = BankAccount(number: "2", balance: 2000)
let account3 = BankAccount(number: "3", balance: 3000)

bank.addAccount(account: account1)
bank.addAccount(account: account2)
bank.addAccount(account: account3)

bank.printAccounts()

bank.deposit(accountNumber: "1", amount: 1000)
bank.withdraw(accountNumber: "2", amount: 2000)
bank.transfer(fromAccountNumber: "3", toAccountNumber: "2", amount: 2000)
bank.printAccounts()
