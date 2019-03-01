//
//  Networking.swift
//  Tracker
//
//  Created by Henrik on 2019-02-18.
//  Copyright © 2019 Henrik. All rights reserved.
//

import UIKit

struct BitCoinData: Codable {
    let ask: Float
}


public class Networking {
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹","¥", "$", "kr", "$", "zł", "L", "p.", "kr", "$", "$", "R"]
    var finalURL = [String]()
    var jsonText: String = ""
    var flagImage: UIImage = UIImage()
    var price : String = ""
    var prettyText: [String: Any] = [:]
    var pricelist = PriceList()
    var pricedata = PriceData()
    var list = [String]()
    
    func getURL(){
        for index in 0...self.currencyArray.count - 1{
            var country = baseURL + currencyArray[index]
            finalURL.append(country)
        }
    }
        
        
    func getData(completion : @escaping ()-> Void){
        for index in 0...finalURL.count{
        guard let url = URL(string: finalURL[index]) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error{
                print(error)
            }
            
            guard let data = data else { return }
            do{
                guard let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {return}
                
                self.jsonText = String(data: data, encoding: .utf8)!
                self.prettyText = jsonResponse
                let myBitcoin = try JSONDecoder().decode(BitCoinData.self, from: data)
                self.price = String(myBitcoin.ask)
                self.list.append(self.price)
                
            }catch let jsonError{
                print("Error \(jsonError)")
            }
            completion()
            }.resume()
        }
        return
    }

    
    
    
//    func getData(completion : @escaping ()-> Void){
//
//        guard let url = URL(string: finalURL) else {return}
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if let error = error{
//                print(error)
//            }
//
//            guard let data = data else { return }
//            do{
//               guard let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {return}
//
//                self.jsonText = String(data: data, encoding: .utf8)!
//                self.prettyText = jsonResponse
//                let myBitcoin = try JSONDecoder().decode(BitCoinData.self, from: data)
//                self.price = String(myBitcoin.ask)
//                self.list.append(self.price)
//
//            }catch let jsonError{
//                print("Error \(jsonError)")
//            }
//            completion()
//            }.resume()
//        return
//        }
    
    
    
//    func getData(url: String) -> String {
//
//        guard let url = URL(string: finalURL) else {return "No Network Connection"}
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            guard let data = data else { return }
//            do{
//                let myBitcoin = try JSONDecoder().decode(BitCoinData.self, from: data)
//                self.price = String(myBitcoin.ask)
//            }catch let jsonError{
//                print("Error \(jsonError)")
//            }
//            }.resume()
//        return price
//    }
    
    
//    func getJSON() -> String{
//        
//        guard let url = URL(string: finalURL) else {return "No Network Connection"}
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let dataResponse = data,
//                error == nil else {
//                    print(error?.localizedDescription ?? "Response Error")
//                    return }
//            do{
//                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
//                self.jsonText = String(data: dataResponse, encoding: .utf8)!
//                self.prettyText = jsonResponse as! [String : Any]
//                
////                print("text: \(self.jsonText)")
//            } catch let parsingError {
//                print("Error", parsingError)
//            }
//        }
//        task.resume()
//        return jsonText
//    }
    
    func flagArray(land: String) -> UIImage{
        let imgUrl = "https://www.countryflags.io/\(land)/flat/64.png"
        guard let url = URL(string: imgUrl) else {return flagImage}
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.flagImage = image
                    }
                }
            }
        }
        return flagImage
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
    
//    func getPrice(row: Int) -> String{
//        finalURL = baseURL + currencyArray[row]
//        let bitcoinPrice = currencySymbolArray[row] + " " + getData(completion: finalURL)
//        print(finalURL)
//        return bitcoinPrice
//    }
//    

    
    func downloadData(){
        var bcURL = ""
        self.getData { () in
            for index in 0...self.currencyArray.count - 1{
                bcURL = self.baseURL + self.currencyArray[index]
                let value = self.list.count
               print(bcURL)
//                print(self.finalURL ,value, " " , self.list, "   ", self.list.count)
            }
            
        }
    }
    
}


//class Personkatalog{
//    var list = [Person]()
//
//    func getAllData(completion : @escaping (String?)->()){
//        let jsonUrlString = finalURL
//
//        guard let url = URL(string: jsonUrlString) else {return}
//        URLSession.shared.dataTask(with: url) { (data, respons, error) in
//            if let error = error{
//                completion(error.localizedDescription)
//            }
//            guard let dataResp = data else {return}
//            do{
//                guard let json = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as? [String : Any] else {return}
//                if let data = json["personlista"] as? [String : Any]{
//                    if let personer = data["person"] as? [Any]{
//                        for (index, person) in personer.enumerated(){
//                            if let person = person as? [String : Any] {
//                                if let firstName = person["tilltalsnamn"] as? String,
//                                    let lastName = person["efternamn"] as? String,
//                                    let yearOfBirth = person["fodd_ar"] as? String,
//                                    let parti = person["parti"] as? String,
//                                    let urlLink = person["bild_url_192"] as? String,
//                                    let gender = person["kon"] as? String {
//
//                                    let newPerson = Person(firstName: firstName, lastName: lastName, yearOfBirth: yearOfBirth, parti: parti, urlLink: urlLink, gender: gender)
//                                    self.list.append(newPerson)
//                                    if index == personer.count-1{
//                                        completion(nil)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                //self.genderBalance()
//            }
//            catch{
//                print("error serialization")
//            }
//        }.resume()
//}
//
//
//    func networkCall(completion: @escaping (String) -> Void) {
//        let mainQueue = DispatchQueue.main
//        let deadline = DispatchTime.now() + .seconds(3)
//        let date = Date()
//        let data = getData(url: "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCSEK")
//        print(date, " ", data)
//        mainQueue.asyncAfter(deadline: deadline) {
//            completion(data)
//            print(data)
//        }
//    }

//func getData(url: String, completion: @escaping (String?) -> Void) -> String {
//
//    guard let url = URL(string: finalURL) else {return "No Network Connection"}
//    URLSession.shared.dataTask(with: url) { (data, response, err) in
//        guard let data = data else { return }
//        do{
//            let myBitcoin = try JSONDecoder().decode(BitCoinData.self, from: data)
//            self.price = String(myBitcoin.ask)
//            completion(String(myBitcoin.ask))
//        }catch let jsonError{
//            print("Error \(jsonError)")
//            completion(nil)
//        }
//        }.resume()
//    return self.price
//}



//func convertDictionaryToJsonString(dict: NSMutableDictionary) -> String {
//    let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions())
//    if let jsonString = NSString(data: jsonData!, encoding: String.Encoding.utf8.rawValue) {
//        return "\(jsonString)"
//    }
//    return ""
//}

