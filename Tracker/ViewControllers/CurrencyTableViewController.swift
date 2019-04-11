

import UIKit

class CurrencyTableViewController: UITableViewController{
    

    let getPrices = NetworkService()
    let getFlags = GetDataFlags()
    var urls = [URL]()
    var prices = [BitCoinData]()
    
    @IBOutlet weak var networkButton: UIBarButtonItem!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup(){
        
        getFlags.getAllFlags()
        getFlags.getImages()
        loadData()
//        getPrices.generateURLS()
        self.view.addSubview(popUpView)
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        popUpView.center.x = screenWidth / 2
        popUpView.center.y = screenHeight / 3
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
    
    func loadData() {
        updateUsers{ (error) in
            self.tableView.reloadData()
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
//                    if let label = cell.viewWithTag(1) as? UILabel {
//                        let price = prices[indexPath.row].ask
//                        label.text = String(price)
//                    }
        
        print("**************************")
        //            if let detailLabel = cell.viewWithTag(2) as? UILabel {
        //                let volume = self.getPrices.pricelist[indexPath.row]
        //                detailLabel.text = String(volume.volume)
        //
        self.activityView.stopAnimating()
        self.activityView.hidesWhenStopped = true
        self.popUpView.removeFromSuperview()
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        if let cell = tableView.cellForRow(at: indexPath){
        //            cell.imageView?.image = pricelist.flagArray[indexPath.row - 1]
        //        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}



