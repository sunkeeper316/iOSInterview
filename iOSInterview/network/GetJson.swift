

import Foundation


func getData(){
    let url = URL(string: "https://willywu0201.github.io/data/emptyNotificationList.json")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Error: \(error)")
        return
      }
      
      guard let data = data else {
        print("No data received")
        return
      }
      
      do {
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        print(json)
      } catch let error as NSError {
        print("Error: \(error)")
      }
    }
    task.resume()
}
