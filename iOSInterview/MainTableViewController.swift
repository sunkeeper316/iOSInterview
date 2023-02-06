
import UIKit

class MainTableViewController: UITableViewController {

    @IBOutlet weak var tfUSDamount: CustomTextField!
    @IBOutlet weak var tfKHRamount: CustomTextField!
    
    @IBOutlet weak var itemNotification: UIBarButtonItem!
    
    var messages: [NotificationMessage] = [NotificationMessage]()
//    var refreshControl:UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfUSDamount.delegate = self
        tfKHRamount.delegate = self
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "refresh...")
                
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.addSubview(refreshControl!)
        
        getNotificationMessageTask(Notification_Empty ){[unowned self] notifications,error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let notifications = notifications {
                    messages = notifications
                    print(messages.count)
                }
            }
        }
    }
    
    @objc func loadData(){
        print("loadData")
        
        getNotificationMessageTask(Notification_NotEmpty ){[unowned self] notifications,error in
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
            }
            
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let notifications = notifications {
                    messages = notifications
                    DispatchQueue.main.async {
                        itemNotification.image = UIImage(named: "iconBell02Active")
                    }
                    
                    print(messages.count)
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    @IBAction func clickNotification(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController {
            vc.messages = self.messages
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainTableViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}
