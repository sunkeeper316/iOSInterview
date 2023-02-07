
import UIKit

class MainTableViewController: UITableViewController {

    @IBOutlet weak var tfUSDamount: CustomTextField!
    @IBOutlet weak var tfKHRamount: CustomTextField!
    
    @IBOutlet weak var noFavoriteImage: UIImageView!
    @IBOutlet weak var noFavoriteLabel: UILabel!
    @IBOutlet weak var noFavoriteLabel2: UILabel!
    
    @IBOutlet weak var itemNotification: UIBarButtonItem!
    
    @IBOutlet weak var favoriteCollectionview: UICollectionView!
    @IBOutlet weak var adBannerCollectionview: UICollectionView!
    
    var messages: [NotificationMessage] = [NotificationMessage]()
    var favorites: [Favorite] = [Favorite]()
    var banners: [ADBanner] = [ADBanner]()
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var timer: Timer?
    var scrollright = true
    
    var usd_Saving = 0.0
    var usd_Fixed = 0.0
    var usd_Digital = 0.0
    
    var khr_Saving = 0.0
    var khr_Fixed = 0.0
    var khr_Digital = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfUSDamount.delegate = self
        tfKHRamount.delegate = self
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "refresh...")
                
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.addSubview(refreshControl!)
        favoriteCollectionview.delegate = self
        favoriteCollectionview.dataSource = self
        adBannerCollectionview.delegate = self
        adBannerCollectionview.dataSource = self
        favoriteCollectionview.register(UINib(nibName: "FavoriteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavoriteCollectionViewCell")
        adBannerCollectionview.register(UINib(nibName: "ADBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ADBannerCollectionViewCell")
        
        getNotificationMessageTask(Notification_Empty ){[unowned self] notifications,error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let notifications = notifications {
                    messages = notifications
                }
            }
        }
        
        getADBannerTask(AD_Banner) {[unowned self] asBanners, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let adBanners = asBanners {
                    banners = adBanners
                    DispatchQueue.main.async { [unowned self] in
                        pageControl.numberOfPages = banners.count
                        adBannerCollectionview.reloadData()
                        if timer == nil {
                            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerRunBanner), userInfo: nil, repeats: true)
                        }
                    }
                }
            }
        }
        getAccountTask(USD_Saving) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    usd_Saving = account.balance ?? 0.0
                    checkShowUSD()
                }
            }
        }
        getAccountTask(USD_Fixed) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    usd_Fixed = account.balance ?? 0.0
                    checkShowUSD()
                }
            }
        }
        getAccountTask(USD_Digital) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    usd_Digital = account.balance ?? 0.0
                    checkShowUSD()
                }
            }
        }
        
        //=====KHR
        getAccountTask(KHR_Saving) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    khr_Saving = account.balance ?? 0.0
                    checkShowKHR()
                }
            }
        }
        getAccountTask(KHR_Fixed) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    khr_Fixed = account.balance ?? 0.0
                    checkShowKHR()
                }
            }
        }
        getAccountTask(KHR_Digital) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    khr_Digital = account.balance ?? 0.0
                    checkShowKHR()
                }
            }
        }
    }
    func checkShowUSD(){
        if usd_Saving != 0.0 &&  usd_Fixed != 0.0 &&  usd_Digital != 0.0 {
            DispatchQueue.main.async { [unowned self] in
                tfUSDamount.text = "\(usd_Saving),\(usd_Fixed),\(usd_Digital)"
            }
        }
    }
    
    func checkShowKHR(){
        if khr_Saving != 0.0 &&  khr_Fixed != 0.0 &&  khr_Digital != 0.0 {
            DispatchQueue.main.async { [unowned self] in
                tfKHRamount.text = "\(khr_Saving),\(khr_Fixed),\(khr_Digital)"
            }
        }
    }
    func resetAccount(){
        usd_Saving = 0.0
        usd_Fixed = 0.0
        usd_Digital = 0.0
        khr_Saving = 0.0
        khr_Fixed = 0.0
        khr_Digital = 0.0
    }
    
    @IBAction func clickEye(_ sender: UIButton) {
        tfUSDamount.isSecureTextEntry = !tfUSDamount.isSecureTextEntry
        tfKHRamount.isSecureTextEntry = !tfKHRamount.isSecureTextEntry
    }
    @objc func timerRunBanner(){
        if (pageControl.currentPage + 1) > (banners.count - 1) {
            scrollright = false
        }else if ((pageControl.currentPage - 1) < 0){
            scrollright = true
        }
        
        if scrollright {
            pageControl.currentPage += 1
            adBannerCollectionview.scrollToItem(at: IndexPath(row: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
        }else{
            pageControl.currentPage -= 1
            adBannerCollectionview.scrollToItem(at: IndexPath(row: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
        }
        
    }
    
    @objc func loadData(){
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
                }
            }
        }
        
        getFavoriteTask(Favorite_NotEmpty) { [unowned self] _favorites,error in
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
            }
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let _favorites = _favorites {
                    favorites = _favorites
                    DispatchQueue.main.async { [unowned self] in
                        noFavoriteImage.isHidden = true
                        noFavoriteLabel.isHidden = true
                        noFavoriteLabel2.isHidden = true
                        favoriteCollectionview.reloadData()
                    }
                }
            }
        }
        
        //======== get Account
        resetAccount()
        getAccountTask(USD_Saving_Pull) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    usd_Saving = account.balance ?? 0.0
                    checkShowUSD()
                }
            }
        }
        getAccountTask(USD_Fixed_Pull) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    usd_Fixed = account.balance ?? 0.0
                    checkShowUSD()
                }
            }
        }
        getAccountTask(USD_Digital_Pull) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    usd_Digital = account.balance ?? 0.0
                    checkShowUSD()
                }
            }
        }
        
        //=====KHR
        getAccountTask(KHR_Saving_Pull) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    khr_Saving = account.balance ?? 0.0
                    checkShowKHR()
                }
            }
        }
        getAccountTask(KHR_Fixed_Pull) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    khr_Fixed = account.balance ?? 0.0
                    checkShowKHR()
                }
            }
        }
        getAccountTask(KHR_Digital_Pull) { [unowned self] account, error in
            if let error = error {
              print("Error: \(error)")
              return
            }else{
                if let account = account {
                    khr_Digital = account.balance ?? 0.0
                    checkShowKHR()
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        if banners.count != 0 {
            if timer == nil {
                timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerRunBanner), userInfo: nil, repeats: true)
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }

    @IBAction func clickNotification(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController {
            vc.messages = self.messages
            vc.title = "Notification"
            vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .bordered, target: nil, action: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

extension MainTableViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}

extension MainTableViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        
        let index = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(index)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == favoriteCollectionview {
            return favorites.count
        }else {
            return banners.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == favoriteCollectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionViewCell", for: indexPath) as! FavoriteCollectionViewCell
            let favorite = favorites[indexPath.row]
            cell.lbFavorite.text = favorite.nickname
            cell.imageFavorite.image = getTransTypeImage(transType: favorite.transType ?? "")
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ADBannerCollectionViewCell", for: indexPath) as! ADBannerCollectionViewCell
            let banner = banners[indexPath.row]
            if let url = banner.linkUrl {
                setImageFromStringrURL(stringUrl:url) { image, error in
                  
                    if let image = image {
                        DispatchQueue.main.async { [unowned self] in
                            if indexPath == collectionView.indexPath(for: cell) {
//                                cell.imageADBanner.adjustsImageSizeForAccessibilityContentSizeCategory = true
//                                cell.imageADBanner.contentMode = .scaleAspectFit
                                cell.imageADBanner.image = image
                            }
                            
                        }
                        
                    }
                }
            }else{
                cell.imageADBanner.image = nil
            }
            
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == favoriteCollectionview  {
            return CGSize(width: 80, height: 80)
        }else{
//            print("width\(collectionView.frame.width) height \(collectionView.frame.height)")
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        
    }
    
    
}
