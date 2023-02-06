
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
