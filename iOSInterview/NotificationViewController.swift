

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var messages: [NotificationMessage] = [NotificationMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
        
        self.tabBarController?.tabBar.isHidden = true
        print("messages \(messages)")
    }
    
}

extension NotificationViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        let message = messages[indexPath.row]
        cell.lbTitle.text = message.title
        cell.lbMessage.text = message.message
        cell.lbUpdateDateTime.text = message.updateDateTime
        if let status = message.status {
            if status {
                cell.viewStatus.isHidden = false
            }else{
                cell.viewStatus.isHidden = true
            }
        }else{
            cell.viewStatus.isHidden = true
        }
        
        return cell
    }
    
    
}
