

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {

        tabBar.frame.size.height = 50
        tabBar.backgroundColor = .clear
        tabBar.frame.size.width = view.bounds.width - 48
        tabBar.frame.origin.x = 24
        tabBar.frame.origin.y = view.bounds.height - 100

        tabBar.layer.cornerRadius = 25
        tabBar.clipsToBounds = true
        tabBar.tintColor = UIColor.orange01
        
    }
    
}
