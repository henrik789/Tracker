
import UIKit

struct BitCoinData: Codable {
    var ask: Float
    var volume: Float
}


class NetworkService {
    //    init() { }
    func addRequest(_ request: Request, completion: @escaping (Data)-> Void) {
        
        let priceURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD"
        
        guard let url = URL(string: priceURL) else {return}
        let task = URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: .mutableContainers)
                completion(dataResponse)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func getPrices(completion: @escaping ([BitCoinData], Error?) -> Void) {
        addRequest(.getUsers) { (dataResponse) in
            var prices = [BitCoinData]()
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





//
//public class GetDataPrice{
//
//
//    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
//    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
//    let currencySymbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹","¥", "$", "kr", "$", "zł", "L", "p.", "kr", "$", "$", "R"]
//    var JSONData = [String]()
//    var jsonText: String = ""
//    var price : String = ""
//    var volume : String = ""
//    var timestamp  : String = ""
//    var prettyText: [String: Any] = [:]
//    var pricelist = [BitCoinData]()
//    var urlList = [String]()
//
//    func getData(finalURL: String) {
//
//        guard let url = URL(string: finalURL) else {return}
//        URLSession.shared.dataTask(with: url) {
//            (data, response, err) in
//            guard let data = data else { return }
//            do{
//                let myBitcoin = try JSONDecoder().decode(BitCoinData.self, from: data)
//
//                self.pricelist.append(myBitcoin)
//                print(self.pricelist.count, finalURL)
//                print(myBitcoin.ask)
//            }catch let jsonError{
//                print("JSON Error: \(jsonError)")
//            }
//            }
//            .resume()
//    }
//
//    func generateURLS(){
//        for index in 0..<currencyArray.count{
//            let finalURL = baseURL + currencyArray[index]
//            OperationQueue.main.addOperation {
//                self.getData(finalURL: finalURL)
//            }
//        }
//    }
//
//
//
//}










//    func getJSON(finalURL: String) -> String{
//        //        for index in 0...list.count - 1{
//        guard let url = URL(string: finalURL) else {return "No Network Connection"}
//        let task = URLSession.shared.dataTask(with: url)
//        { (data, response, error) in
//            guard let dataResponse = data,
//                error == nil else {
//                    print(error?.localizedDescription ?? "Response Error")
//                    return }
//            do{
//                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
//                self.jsonText = String(data: dataResponse, encoding: .utf8)!
//                self.JSONData.append(self.jsonText)
//                //                self.prettyText = jsonResponse as! [String : Any]
//                //                    print(finalURL)
//
//            } catch let parsingError {
//                print("Error", parsingError)
//            }
//        }
//        task.resume()
//        //        }
//        print("From getJson: \(JSONData)")
//        return jsonText
//    }
