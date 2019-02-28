

import UIKit

class CurrencyTableViewController: UITableViewController{

    
    let networking = Networking()
    var pricedata = PriceData()
    var pricelist: PriceList
    
    required init?(coder aDecoder: NSCoder) {
        pricelist = PriceList()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        networking.networkCall{ (date) in
//                let date = Date()
//                print(date, "hejsan")
//        }
        networking.downloadData()
//        print(pricelist.priceArray)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .default

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return networking.currencyArray.count
//        print(pricelist.priceArray.count)
        return 10
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let label = cell.viewWithTag(1) as? UILabel {
//            label.text = pricelist.priceArray[indexPath.row]
        }
//        cell.imageView?.image = pricelist.flagArray[indexPath.row]
//            let countryCode = networking.setNation(row: indexPath.row)
//            cell.imageView?.image = networking.flagArray(land: countryCode)
        tableView.reloadData()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath){
            cell.imageView?.image = pricelist.flagArray[indexPath.row]
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
