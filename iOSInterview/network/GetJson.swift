

import Foundation

func getNotificationMessageTask(_ urlstr: String, completionHandler: @escaping ([NotificationMessage]?, Error?) -> Void) {
    let url = URL(string: urlstr)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Error: \(error)")
          completionHandler(nil , error)
        return
      }
      
        if let data = data {
            do {
              let decoder = JSONDecoder()
                if let result = try? decoder.decode(GetDataNotification.self, from: data) {
                    if let messages = result.result?.messages {
                        completionHandler(messages , nil)
                    }else{
                        completionHandler(nil , nil)
                    }
                }else{
                    completionHandler(nil , nil)
                }
              
            } catch let error as NSError {
              print("Error: \(error)")
                completionHandler(nil , error)
            }
        }else{
            print("No data received")
            completionHandler(nil , nil)
            return
        }
      
      
    }
    task.resume()
}
func getAccountTask(_ urlstr: String, completionHandler: @escaping (Account?, Error?) -> Void) {
    let url = URL(string: urlstr)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Error: \(error)")
          completionHandler(nil , error)
        return
      }
      
        if let data = data {
            do {
              let decoder = JSONDecoder()
                if let result = try? decoder.decode(GetDataAccount.self, from: data) {
                    if let digitalList = result.result?.digitalList {
                        if digitalList.count > 0 {
                            completionHandler(digitalList.first , nil)
                            return
                        }
                    }else if let savingsList = result.result?.savingsList {
                        if savingsList.count > 0 {
                            completionHandler(savingsList.first , nil)
                            return
                        }
                    }else if let fixedDepositList = result.result?.fixedDepositList {
                        if fixedDepositList.count > 0 {
                            completionHandler(fixedDepositList.first , nil)
                            return
                        }
                    }
                }else{
                    completionHandler(nil , nil)
                    return
                }
              
            } catch let error as NSError {
              print("Error: \(error)")
                completionHandler(nil , error)
                return
            }
        }else{
            print("No data received")
            completionHandler(nil , nil)
            return
        }
      
        completionHandler(nil , nil)
    }
    task.resume()
}
func getFavoriteTask(_ urlstr: String, completionHandler: @escaping ([Favorite]?, Error?) -> Void) {
    let url = URL(string: urlstr)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Error: \(error)")
          completionHandler(nil , error)
        return
      }
      
        if let data = data {
            do {
              let decoder = JSONDecoder()
                if let result = try? decoder.decode(GetDataFavorite.self, from: data) {
                    if let favoriteList = result.result?.favoriteList {
                        completionHandler(favoriteList , nil)
                    }else{
                        completionHandler(nil , nil)
                    }
                }else{
                    completionHandler(nil , nil)
                }
              
            } catch let error as NSError {
              print("Error: \(error)")
                completionHandler(nil , error)
            }
        }else{
            print("No data received")
            completionHandler(nil , nil)
            return
        }
      
      
    }
    task.resume()
}

func getADBannerTask(_ urlstr: String, completionHandler: @escaping ([ADBanner]?, Error?) -> Void) {
    let url = URL(string: urlstr)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Error: \(error)")
          completionHandler(nil , error)
        return
      }
      
        if let data = data {
            do {
              let decoder = JSONDecoder()
                if let result = try? decoder.decode(GetDataADBanner.self, from: data) {
                    if let bannerList = result.result?.bannerList {
                        completionHandler(bannerList , nil)
                    }else{
                        completionHandler(nil , nil)
                    }
                }else{
                    completionHandler(nil , nil)
                }
              
            } catch let error as NSError {
              print("Error: \(error)")
                completionHandler(nil , error)
            }
        }else{
            print("No data received")
            completionHandler(nil , nil)
            return
        }
      
      
    }
    task.resume()
}


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
