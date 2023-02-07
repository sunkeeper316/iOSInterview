import UIKit
import Foundation

class GetDataFavorite : Codable{
    var msgCode: String?
    var msgContent : String?
    var result : FavoriteResult?
}

class FavoriteResult : Codable{
    var favoriteList: [Favorite]?
}

class Favorite : Codable{
    var nickname: String?
    var transType: String?
}

func getTransTypeImage(transType: String) -> UIImage?{
    if transType == "CUBC"{
        return UIImage(named: "button00ElementScrollTree")
    }else if transType == "Mobile"{
        return UIImage(named: "button00ElementScrollMobile")
    }else if transType == "PMF"{
        return UIImage(named: "button00ElementScrollBuilding")
    }else if transType == "CreditCard"{
        return UIImage(named: "button00ElementScrollCreditCard")
    }
    
    return nil
}
