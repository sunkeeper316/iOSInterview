

import Foundation
class GetDataNotification : Codable{
    var msgCode: String?
    var msgContent : String?
    var result : NotificationResult?
}

class NotificationResult : Codable{
    var messages: [NotificationMessage]?
}

class NotificationMessage : Codable{
    var status: Bool?
    var updateDateTime: String?
    var title: String?
    var message: String?
}


