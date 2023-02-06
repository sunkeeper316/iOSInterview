
import Foundation

class GetDataADBanner : Codable{
    var msgCode: String?
    var msgContent : String?
    var result : ADBannerResult?
}

class ADBannerResult : Codable{
    var bannerList: [ADBanner]?
}

class ADBanner : Codable{
    var adSeqNo: Int?
    var linkUrl: String?
}


