

import UIKit

class CurrencyTableViewController: UITableViewController{
    
    
    let networking = Networking()
    var pricedata = PriceData()
    var pricelist: PriceList
    var name = ""
    required init?(coder aDecoder: NSCoder) {
        pricelist = PriceList()
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networking.getData(finalURL: "https://jsonplaceholder.typicode.com/users")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .default
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networking.currencyArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let countryCode = self.networking.setNation(row: indexPath.row)
        cell.imageView?.image = self.networking.flagArray(land: countryCode)
        
        if cell.accessoryView == nil{
            let indicator = UIActivityIndicatorView(style: .gray)
            cell.accessoryView = indicator
        }
        
        let mainQueue = DispatchQueue.main
        let deadline = DispatchTime.now() + .seconds(2)
        mainQueue.asyncAfter(deadline: deadline){
            if let label = cell.viewWithTag(1) as? UILabel {
                let price = self.networking.pricelist[1]
                let priceText = price
                label.text = priceText as? String
            }
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



