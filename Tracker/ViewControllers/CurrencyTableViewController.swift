

import UIKit

class CurrencyTableViewController: UITableViewController{
    
    let getFlags = GetDataFlags()
    let getPrices = GetDataPrice()
    var urls = [URL]()
    
    @IBOutlet weak var networkButton: UIBarButtonItem!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup(){
        
        for index in 0..<getFlags.currencyArray.count{
            let land = getFlags.setNation(row: index)
            let imageUrl = URL(string: "https://www.countryflags.io/\(land)/flat/64.png")
            urls.append(imageUrl!)
        }
        getPrices.generateURLS()
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
    
    func getImageData(location: URL) -> Data? {
        var imageData: Data? = nil
        do {
            try imageData = Data(contentsOf: location)
        } catch {
            
        }
        return imageData
        
    }
    
    @IBAction func networkAction(_ sender: Any) {
        
        //        getPrices.getData(finalURL: "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 21
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .none
        
        let task = URLSession.shared.downloadTask(with: urls[indexPath.row]) {
            (location, response, error) in
            guard let location = location,
                let imageData = self.getImageData(location: location),
                let image = UIImage(data: imageData) else { return }
            OperationQueue.main.addOperation {
                cell.imageView?.image = image
            }
        }
        task.resume()
        
        
            print("**************************")
//            if let label = cell.viewWithTag(1) as? UILabel {
//                let price = self.getPrices.pricelist[indexPath.row]
//                label.text = String(price.ask)
//            }
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



