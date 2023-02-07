

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillLayoutSubviews() {
        
    }
    
    override func viewDidLayoutSubviews() {
//        guard let tabBar = self.tabBar as? CustomTabBar else { return }
            
            
        
        tabBar.frame.size.height = 50
        tabBar.backgroundColor = .clear
        tabBar.frame.size.width = view.bounds.width - 48
        tabBar.frame.origin.x = 24
        tabBar.frame.origin.y = view.bounds.height - 100
        tabBar.backgroundImage = UIImage()
        tabBar.layer.cornerRadius = 25
//        tabBar.clipsToBounds = true
        
//        tabBar.clipsToBounds = false
////        tabBar.roundCorners(corners: [.topLeft, .topRight ,.bottomLeft , .bottomRight], radius: 25)
//        tabBar.addShadow(offset: CGSize(width: 0, height: 2), color: .black, radius: 4, opacity: 1)
        
//        let layer = CAShapeLayer()
////            layer.path = UIBezierPath(roundedRect: CGRect(x: 30,
////                                                          y: tabBar.bounds.minY + 5,
////                                                          //y: tabBar.bounds.minY - 28,
////                                                          width: tabBar.bounds.width - 60,
////                                                          height: tabBar.bounds.height - 24),
////                                      cornerRadius: (tabBar.frame.width / 2)).cgPath
//            layer.shadowColor = UIColor.lightGray.cgColor
//            layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//            layer.shadowRadius = 25.0
//            layer.shadowOpacity = 0.3
//            layer.borderWidth = 1.0
//            layer.opacity = 1.0
//            layer.masksToBounds = false
//            layer.fillColor = UIColor.white.cgColor
//
//        tabBar.layer.insertSublayer(layer, at: 0)
        
//        let path = UIBezierPath(roundedRect: tabBar.bounds, byRoundingCorners: [.topLeft, .topRight ,.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 25, height: 25))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        tabBar.layer.mask = mask
//        tabBar.backgroundColor = UIColor.white
//
//        tabBar.clipsToBounds = false
////        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
//        tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
//        tabBar.layer.shadowRadius = 5
//        tabBar.layer.shadowColor = UIColor.black.cgColor
//        tabBar.layer.shadowOpacity = 1
//
        tabBar.tintColor = UIColor.orange01
        
    }
    

    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //history  measure  memo
        print(item.title)
        
    }

}
