

import UIKit

class CurrencyTableViewController: UITableViewController{
    
    let getFlags = GetDataFlags()
    let getPrices = GetDataPrice()

    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup(){
//        getPrices.getData(finalURL: "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD")
        self.view.addSubview(popUpView)
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        popUpView.center.x = screenWidth / 2
        popUpView.center.y = screenHeight / 3
        print(screenHeight, screenWidth, popUpView.center.y)
        popUpView.layer.cornerRadius = 49
        popUpView.clipsToBounds = true
        popUpView.layer.shadowColor = UIColor.black.cgColor
        popUpView.layer.shadowOpacity = 0.8
        popUpView.layer.shadowRadius = 10
        popUpView.layer.shadowOffset = CGSize(width: -1, height: 3)
        getFlags.getAllFlags()
        activityView.startAnimating()
        print(getFlags.flagImageArray.count)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .default
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 21
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if cell.accessoryView == nil{
            let indicator = UIActivityIndicatorView(style: .gray)
            cell.accessoryView = indicator
        }
        
        let mainQueue = DispatchQueue.main
        let deadline = DispatchTime.now() + .seconds(3)
        mainQueue.asyncAfter(deadline: deadline){
            
            cell.imageView?.image = self.getFlags.flagImageArray[indexPath.row]
            self.activityView.stopAnimating()
            self.activityView.hidesWhenStopped = true
            self.popUpView.removeFromSuperview()
            if let label = cell.viewWithTag(1) as? UILabel {
//                let name = self.networking.nameList[indexPath.row]
                label.text = "Det funkar"
            }
//            if let detailLabel = cell.viewWithTag(2) as? UILabel {
//                let phone = self.networking.phoneList[indexPath.row]
//                detailLabel.text = phone
//            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        if let cell = tableView.cellForRow(at: indexPath){
        //            cell.imageView?.image = pricelist.flagArray[indexPath.row - 1]
        //        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    
}



