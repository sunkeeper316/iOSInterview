

import Foundation

class GetDataAccount : Codable{
    var msgCode: String?
    var msgContent : String?
    var result : AccountResult?
}

class AccountResult : Codable{
    var savingsList: [Account]?
    var fixedDepositList: [Account]?
    var digitalList: [Account]?
}

class Account : Codable{
    var account: String?
    var curr : String?
    var balance : Double?
}

  
