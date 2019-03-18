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
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var detailView: UIView!
    @IBOutlet weak var popupTextView: UITextView!
    
    
    var effect: UIVisualEffect!
    var pricelist = PriceList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        effect = blurView.effect
        blurView.isHidden = true
        detailView.layer.cornerRadius = 15
        
    }

    
    @IBAction func openView(_ sender: Any) {
        
        animateIn(completion: { () -> Void in blurView.isHidden = false})
    }
    
    @IBAction func closeView(_ sender: Any) {
        animateOut(completion: { () -> Void in blurView.isHidden = false})
    }
    
    func animateIn(completion: () -> Void) {
        self.view.addSubview(detailView)
        
        detailView.center = self.view.center
        detailView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        detailView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.blurView.effect = self.effect
            self.detailView.alpha = 1
            self.detailView.transform = CGAffineTransform.identity
        }
        completion()
    }
    
    
    func animateOut (completion: () -> Void) {
        UIView.animate(withDuration: 0.3, animations: {
            self.detailView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.detailView.alpha = 0
            self.blurView.effect = nil
            
        }) { (success:Bool) in
            self.detailView.removeFromSuperview()
        }
        completion()
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//            return networking.currencyArray.count
        return 12
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return String(networking.currencyArray[row])
        return "Title here"
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        let countryCode = networking.setNation(row: row)
//        flagImage.image = networking.flagArray(land: countryCode)
//        let bitcoinPrice: String = networking.price
//        self.bitcoinPriceLabel.text = "Price: \(bitcoinPrice)"
////        let info = networking.getJSON()
//        self.textView.attributedText = prettyString(fromDictionary: networking.prettyText)
//        print(info)
    }
    
}

