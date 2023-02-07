

import UIKit

class CustomTabBarController: UITabBarController {
    
    var barview : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        tabBar.frame.size.height = 50
        tabBar.backgroundColor = .clear
        tabBar.frame.size.width = view.bounds.width - 48
        tabBar.frame.origin.x = 24
        tabBar.frame.origin.y = view.bounds.height - 100
        if barview == nil {
            barview = UIView()
            barview.frame = tabBar.frame
            barview.layer.cornerRadius = 25
            barview.backgroundColor = .gray
            barview.layer.shadowColor = UIColor.black.cgColor
            barview.layer.shadowOffset = CGSize(width: 2, height: 2)
            barview.layer.shadowOpacity = 0.2
            barview.layer.shadowRadius = 5
            barview.layer.shadowOpacity = 0.5
            barview.layer.masksToBounds = false
            view.insertSubview(barview, belowSubview: self.tabBar)
        }
        
        tabBar.layer.cornerRadius = 25
        tabBar.clipsToBounds = true
        tabBar.tintColor = UIColor.orange01
        
    }
    
}
