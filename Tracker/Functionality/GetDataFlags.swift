import UIKit

class GetDataFlags {
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var flagImage: UIImage = UIImage()
    var flagImageArray: [UIImage] = []
    var urlArray: [URL] = []
    
    func getAllFlags(){
        for index in 0..<currencyArray.count{
            let land = setNation(row: index)
            //            self.getImage(land: countryCode)
            let imageUrl = URL(string: "https://www.countryflags.io/\(land)/flat/64.png")
            urlArray.append(imageUrl!)
        }
        
    }
    
    func getImageData(location: URL) -> Data? {
        var imageData: Data? = nil
        do {
            try imageData = Data(contentsOf: location)
        } catch {
            
        }
        return imageData
        
    }
    
    func getImages(){
        for index in 0..<currencyArray.count {
            
            let myURL = URLRequest(url: urlArray[index])
            let task = URLSession.shared.downloadTask(with: myURL) {
                (location, response, error) in
                guard let location = location,
                    let imageData = self.getImageData(location: location),
                    let image = UIImage(data: imageData) else { return }
                OperationQueue.main.addOperation {
                    //                cell.imageView?.image = image
                    self.flagImageArray.append(image)
                    print("Flagimagearray: ", self.flagImageArray.count, "UrlArray: ", self.urlArray.count)
                }
            }
            task.resume()
        }
    }
    
    func getImage(land: String){
        let imgUrl = "https://www.countryflags.io/\(land)/flat/64.png"
        guard let url = URL(string: imgUrl) else {return}
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.flagImage = image
                        self?.flagImageArray.append(image)
                    }
                }
            }
        }
    }
    
    func setNation(row: Int) -> String{
        let nation = currencyArray[row]
        switch nation {
        case "CAD":
            return "CA"
        case "SEK":
            return "SE"
        case "AUD":
            return "AU"
        case "BRL":
            return "BR"
        case "CNY":
            return "CN"
        case "EUR":
            return "EU"
        case "GBP":
            return "GB"
        case "HKD":
            return "HK"
        case "IDR":
            return "ID"
        case "ILS":
            return "IL"
        case "INR":
            return "IN"
        case "JPY":
            return "JP"
        case "MXN":
            return "MX"
        case "NOK":
            return "NO"
        case "NZD":
            return "NZ"
        case "PLN":
            return "PL"
        case "RON":
            return "RO"
        case "RUB":
            return "RU"
        case "SGD":
            return "SG"
        case "ZAR":
            return "ZA"
        default:
            return "US"
        }
    }
    
}
