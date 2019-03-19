

import UIKit

class CurrencyTableViewController: UITableViewController{
    
    
    let networking = Networking()
    //    var pricedata = PriceData()
    //    var pricelist: PriceList
    
    
    //    required init?(coder aDecoder: NSCoder) {
    //        pricelist = PriceList()
    //        super.init(coder: aDecoder)
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networking.getData(finalURL: "https://jsonplaceholder.typicode.com/users")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .default
        var value = "initial stuff"
        let date = Date()
        print(date)
        
        networkCall{ (date) in
            let date = Date()
            value = "call result : \(date)"
            print(value)
        }
    }
    
    func networkCall(completion: @escaping (String) -> Void) {
        let data = "hej"
        print(data)
        completion(data)
    }
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        if cell.accessoryView == nil{
            let indicator = UIActivityIndicatorView(style: .gray)
            cell.accessoryView = indicator
        }
        
        let mainQueue = DispatchQueue.main
        let deadline = DispatchTime.now() + .seconds(1)
        mainQueue.asyncAfter(deadline: deadline){
            let countryCode = self.networking.setNation(row: indexPath.row)
            cell.imageView?.image = self.networking.flagArray(land: countryCode)
            if let label = cell.viewWithTag(1) as? UILabel {
                let name = self.networking.nameList[indexPath.row]
                label.text = name
            }
            if let detailLabel = cell.viewWithTag(2) as? UILabel {
                let phone = self.networking.phoneList[indexPath.row]
                detailLabel.text = phone
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



