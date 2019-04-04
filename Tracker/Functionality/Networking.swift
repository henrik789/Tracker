//
//import UIKit
//
//struct BitCoinData: Codable {
//    let price: String
//    let volume: String
//}
//
//
//public class Networking {
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
////    func getData(finalURL: String) {
////
////        let configuration = URLSessionConfiguration.default
////        configuration.waitsForConnectivity = true
////        let session = URLSession(configuration: configuration)
////        let url = URL(string: finalURL)!
////        let task = session.dataTask(with: url) {
////            (data, response, error) in
////            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
////                print(HTTPURLResponse.self, finalURL)
////                return
////            }
////            guard let data = data else {
////                print(error.debugDescription)
////                return
////            }
////            do{
////                print("networking.................")
////
////                let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
////                if let array = jsonData as? [Any]{
////                    for object in array{
////                        self.pricelist.append(object)
////                    }
////                    for index in 0..<self.pricelist.count{
////                        if let dictionary = self.pricelist[index] as? [String: Any] {
////                            if let name = dictionary["name"] as? String,
////                                let phone = dictionary["phone"] as? String {
////                                print("Phone:  \(phone) Name: \(name)")
////                                let newPerson = Person(name: name, phone: phone)
////                                self.personList.append(newPerson)
////                            }
////                        }
////                    }
////                    for index in 0..<self.personList.count{
////                        let newPerson = self.personList[index]
////                        self.name = newPerson.name
////                        self.phone = newPerson.phone
////                        self.nameList.append(self.name)
////                        self.phoneList.append(self.phone)
////                        print(self.nameList, self.phoneList)
////                    }
////
////                }
////            }
////
////        }
////        task.resume()
////    }
//    
//    
////    func makeList(url: String) {
////        getData(finalURL: url, completion: { ()   in
////            print(url)
////            //        for index in 0..<pricelist.count{
////            //            if let dictionary = self.pricelist[index] as? [String: Any] {
////            //                if let name = dictionary["name"] as? String,
////            //                    let phone = dictionary["phone"] as? String {
////            //
////            //                    print("Phone:  \(phone)")
////            //                    let newPerson = Person(name: name, phone: phone)
////            //                    self.personList.append(newPerson)
////            //                    print(personList)
////            //                }
////            //            }
////            //        }
////
////        })
////    }
//    
//    
//    // collects all urls in array to use in getjson()
//    //    func getURLs(completion: @escaping () -> Void) {
//    //        for index in 0...currencyArray.count - 1{
//    //            urlList.append(baseURL + currencyArray[index])
//    //            getData(finalURL: urlList[index])
//    //        }
//    //        completion()
//    //    }
//    
//    
//    
//        func getData(finalURL: String) {
//    
//            guard let url = URL(string: finalURL) else {return}
//            URLSession.shared.dataTask(with: url) {
//                (data, response, err) in
//                guard let data = data else { return }
//                do{
//                    let myBitcoin = try JSONDecoder().decode(BitCoinData.self, from: data)
////                    self.price = String(myBitcoin.price)
////                    self.volume = String(myBitcoin.volume)
//                    self.pricelist.append(myBitcoin)
//                }catch let jsonError{
//                    print("Error \(jsonError)")
//                }
//                }
//                .resume()
//        }
//    
//    //
//    //
//    //    // collects all urls in array to use in getjson()
//    //    func getURLs(completion: () -> Void){
//    //        for index in 0...currencyArray.count - 1{
//    //            urlList.append(baseURL + currencyArray[index])
//    //            let finalUrl = urlList[index]
//    //            getData(finalURL: finalUrl, completion: { () in
//    ////                    print("Finito! \(finalUrl)")
//    //            })
//    //        }
//    //        completion()
//    //    }
//    
//    
//    // takes in a url from list[] and fetches the json from that adress to PriceData array of objects
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
//    //
//    //    func getPrice(row: Int) -> String{  // should return price info from the JSON array
//    //        finalURL = baseURL + currencyArray[row]
//    //        let bitcoinPrice = currencySymbolArray[row] // array with all json, one row / land
//    //        print(finalURL)
//    //        return bitcoinPrice
//    //    }
//    
//   
//    
//    
//    //    func getPrice(row: Int) -> String{
//    //        finalURL = baseURL + currencyArray[row]
//    //        let bitcoinPrice = currencySymbolArray[row] + " " + getData(url: finalURL)
//    //        print(finalURL)
//    //        return bitcoinPrice
//    //    }
//}
