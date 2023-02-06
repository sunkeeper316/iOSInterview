

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbUpdateDateTime: UILabel!
    @IBOutlet weak var lbMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
