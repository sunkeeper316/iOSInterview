//
//  CustomTabBarController.swift
//  iOSInterview
//
//  Created by Sun Huang on 2023/2/4.
//

import UIKit

class CustomTabBarController: UITabBarController {

//    var customButtons : [UIButton]!
//    var selecteds = ["icTabbarHomeActive" ,"icTabbarAccountDefault", "icTabbarLocationActive" , "icTabbarLocationActive"]
//    var unselecteds = ["icTabbarHomeActive" ,"icTabbarAccountDefault", "icTabbarLocationActive" , "icTabbarLocationActive"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillLayoutSubviews() {
        
    }
    
    override func viewDidLayoutSubviews() {
        tabBar.frame.size.height = 50
        tabBar.frame.size.width = view.bounds.width - 48
        tabBar.frame.origin.x = 24
        tabBar.frame.origin.y = view.bounds.height - 100
        tabBar.layer.cornerRadius = 20
        tabBar.layer.shadowOffset = CGSize(width: 1, height: 0)
        tabBar.layer.shadowRadius = 3
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.5
        
        tabBar.tintColor = UIColor.orange01
//        self.selectedIndex = 0
//        customButtons = [setTabButton() , setTabButton() , setTabButton() , setTabButton()]
//        for (index,bt) in customButtons.enumerated() {
//            let width = (view.bounds.width - 48 ) / 4
//            bt.tag = index
//            bt.center = CGPoint(x: tabBar.bounds.midX - width * CGFloat((2 - index)) + width * 0.5, y: tabBar.bounds.midY )
//            if index == self.selectedIndex {
//
//                bt.setImage(UIImage(named: selecteds[index]), for: .normal)
//            }else{
//                bt.setImage(UIImage(named: unselecteds[index]), for: .normal)
//
//            }
//            tabBar.addSubview(bt)
//        }
//        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    

    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //history  measure  memo
        print(item.title)
        
    }
//    func setTabButton() -> UIButton{
//        //button_ Personal_selected  button_ measuring_selected  button_ memo_selected
//        let button = UIButton()
//
//
//        button.imageView?.contentMode = .scaleAspectFit
//        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
//        button.frame.size = CGSize(width: tabBar.bounds.width / 4, height: tabBar.bounds.height)
//
//
//        button.clipsToBounds = true
//        button.addTarget(self, action: #selector(showViewController), for: .touchDown)
//
//        return button
//    }
//    @objc func showViewController(_ sender:UIButton) {
//
//    }
//    func setButtonColor(tag:Int){
//        self.selectedIndex = tag
//        for (index , bt) in customButtons.enumerated() {
//            if index == tag {
//                bt.setImage(UIImage(named: selecteds[index]), for: .normal)
//
//            }else{
//
//                bt.setImage(UIImage(named: unselecteds[index]), for: .normal)
//            }
//        }
//    }
}
