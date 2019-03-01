//
//  ItemData.swift
//  Tracker
//
//  Created by Henrik on 2019-02-27.
//  Copyright © 2019 Henrik. All rights reserved.
//

import UIKit


public class PriceData {
    
    var price = ""
    //    var flag: UIImage = UIImage()
//    
//    func getAllData(completion : @escaping (String?)->()){
//        
//        let jsonUrlString = "http://data.riksdagen.se/personlista/?iid=&fnamn=&enamn=&f_ar=&kn=&parti=&valkrets=&rdlstatus=&org=&utformat=json&termlista="
//        
//        guard let url = URL(string: jsonUrlString) else
//        {return}
//        
//        URLSession.shared.dataTask(with: url) { (data, respons, error) in
//            
//            
//            if let error = error{
//                completion(error.localizedDescription)
//            }
//            
//            
//            guard let data = data else {return}
//            
//            do{
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {return}
//                
//                if let data = json["personlista"] as? [String : Any]{
//                    
//                    if let personer = data["person"] as? [Any]{
//                        
//                        for (index, person) in personer.enumerated(){
//                            if let person = person as? [String : Any] {
//                                
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
//                                    
//                                }
//                            }
//                        }
//                        
//                    }
//                }
//                //self.genderBalance()
//            }
//            catch{
//                print("error serialization")
//            }
//            
//            }.resume()
//        
        
}


