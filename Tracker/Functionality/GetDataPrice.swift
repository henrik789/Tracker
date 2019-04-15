
import UIKit

struct BitCoinData: Codable {
    var ask: Float
    var volume: Float
}

class NetworkService {
    
    func addRequest(priceUrl: String, completion: @escaping (Data)-> Void) {
        
        guard let url = URL(string: priceUrl) else {return}
        let task = URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            completion(dataResponse)
        }
        task.resume()
    }
    
    func getPrices(priceUrl: String , completion: @escaping ([BitCoinData], Error?) -> Void) {
        var prices = [BitCoinData]()
        addRequest(priceUrl: priceUrl) { (dataResponse) in
            
            do{
                let myBitcoin = try JSONDecoder().decode(BitCoinData.self, from: dataResponse)
                print(myBitcoin.ask, myBitcoin.volume)
                prices.append(myBitcoin)
            } catch let error {
                print(error)
            }
            completion(prices, nil)
        }
        
    }
    
}


