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
    var finalURL = ""
    var jsonText: String = ""
    var flagImage: UIImage = UIImage()
    var price : String = ""
    var prettyText: [String: Any] = [:]
    var pricelist = PriceList()
    var pricedata = PriceData()
    var list = [String]()
    
    func getData(url: String) -> String {

        guard let url = URL(string: finalURL) else {return "No Network Connection"}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let myBitcoin = try JSONDecoder().decode(BitCoinData.self, from: data)
                self.price = String(myBitcoin.ask)
            }catch let jsonError{
                print("Error \(jsonError)")
            }
            }.resume()
        return price
    }
    
    
    func getJSON() -> String{

        guard let url = URL(string: finalURL) else {return "No Network Connection"}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                self.jsonText = String(data: dataResponse, encoding: .utf8)!
                self.prettyText = jsonResponse as! [String : Any]

//                print("text: \(self.jsonText)")
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        return jsonText
    }
    
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
    
    func getPrice(row: Int) -> String{
        finalURL = baseURL + currencyArray[row]
        let bitcoinPrice = currencySymbolArray[row] + " " + getData(url: finalURL)
        print(finalURL)
        return bitcoinPrice
    }
}
