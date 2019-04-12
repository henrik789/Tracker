

import UIKit

class CurrencyTableViewController: UITableViewController{
    
    
    let getPrices = NetworkService()
    let getFlags = GetDataFlags()
    var urls = [URL]()
    var prices = [BitCoinData]()
    var images = [UIImage]()
    
    @IBOutlet weak var networkButton: UIBarButtonItem!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup(){
        loadData()
        self.view.addSubview(popUpView)
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        popUpView.center.x = screenWidth / 2
        popUpView.center.y = screenHeight / 3
        //        let rect = CGRect(x: 10, y: 10, width: screenWidth, height: screenHeight)
        //        popUpView = UIView(frame: rect)
        popUpView.layer.cornerRadius = 49
        popUpView.clipsToBounds = true
        
        activityView.startAnimating()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .default
        
    }
    
    func updateUsers(completion: @escaping (Error?) -> Void) {
        getPrices.getPrices { (prices, error) in
            guard error == nil else {
                completion(error)
                return
            }
            self.prices = prices
            completion(nil)
        }
    }
    func updateImages(completion: @escaping (Error?) -> Void){
        getFlags.getImages() { (images, error) in
            guard error == nil else {
                completion(error)
                return
            }
            self.images = images
            completion(nil)
        }
    }
    func loadData() {
        updateImages{ (error) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        updateUsers{ (error) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    
    @IBAction func networkAction(_ sender: Any) {
        
        //        getPrices.getData(finalURL: "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return prices.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .none
        print(prices[indexPath.row].ask)
        self.activityView.stopAnimating()
        self.activityView.hidesWhenStopped = true
        self.popUpView.removeFromSuperview()
        
        if let label = cell.viewWithTag(1) as? UILabel {
            let price = String(prices[indexPath.row].ask)
            label.text = "Asking price: \(price)"
        }
        if let label = cell.viewWithTag(2) as? UILabel {
            let volume = String(prices[indexPath.row].volume)
            label.text = "Volume: \(volume)"
        }
        let image : UIImage? = UIImage(named: "Idle2")
        cell.imageView?.image = image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}



