
import UIKit
import Foundation

func setImageFromStringrURL(stringUrl: String ,completionHandler: @escaping (UIImage?, Error?) -> Void) {
    if let url = URL(string: stringUrl) {
    let task =  URLSession.shared.dataTask(with: url) { (data, response, error) in
      // Error handling...
        if let error = error {
            completionHandler(nil, error)
            return
        }
      guard let imageData = data else { return }
//        print("imageData \(imageData)")
        completionHandler(UIImage(data: imageData), nil)
    }
        task.resume()
        
  }
}
