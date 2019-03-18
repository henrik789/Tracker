import UIKit


class Base{
    
    func createUser(username: String, password: String, completion: (Bool, Int) -> Void) {
      
        
        let isSuccess = true
        let userId = 123
        completion(isSuccess, userId)

    }
}


class MyApp{
    
    func regButoonPressed(){
        let base = Base()
        
            base.createUser(username: "Henrik", password: "123456", completion:
                { (isSuccess: Bool, userId: Int) in
                if isSuccess {
                print(isSuccess, "Hejsan")
                }
            })
        
    }
    
}


let myapp = MyApp()

myapp.regButoonPressed()

/*
class tableviewcontroller{
 
 
 
 viewdidload(){
    network.startdownload()
 }
 
 
 cellForRowAt{
    .text = network.list[indexpath.row]
 }
 
}

 class network{
 
 download(){
 for _ in 0 ...currencyArray.count - 1{
        getjson(url, completion )
 
    }
 }
 
 
 getjson(url, completion) -> void
 
 let isSuccess = true
 let priceText = list[index]

 let info = jsonSerialization
 list.append(info)

 
 completion(isSuccess, pricetext)
 
 }
 
*/






















