//
//  ViewController.swift
//  BitcoinTicker
//

import UIKit



class DetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let networking = Networking()
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var flagImage: UIImageView!
    
    var pricelist = PriceList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self

        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return networking.currencyArray.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(networking.currencyArray[row])
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let countryCode = networking.setNation(row: row)
        flagImage.image = networking.flagArray(land: countryCode)
        let bitcoinPrice: String = networking.getPrice(row: row)
        self.bitcoinPriceLabel.text = "Price: \(bitcoinPrice)"
        let info = networking.getJSON()
        self.textView.attributedText = prettyString(fromDictionary: networking.prettyText)
        print(info)
    }
    
}

