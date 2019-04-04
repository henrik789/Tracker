//
//  ViewController.swift
//  BitcoinTicker
//

import UIKit


/*
 button1.layer.shadowColor = UIColor.black.cgColor
 button1.layer.shadowOffset = CGSize(width: 5, height: 5)
 button1.layer.shadowRadius = 5
 button1.layer.shadowOpacity = 1.0
 
 button2.layer.shadowColor = UIColor.black.cgColor
 button2.layer.shadowOffset = CGSize(width: 5, height: 5)
 button2.layer.shadowRadius = 5
 button2.layer.shadowOpacity = 1.0
 */


class DetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var detailView: UIView!
//    @IBOutlet weak var popupTextView: UITextView!
    var getFlags = GetDataFlags()
    
    var effect: UIVisualEffect!
//    var pricelist = PriceList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        effect = blurView.effect
        blurView.isHidden = true
        
    }

    
    @IBAction func openView(_ sender: Any) {
        
        animateIn(completion: { () -> Void in blurView.isHidden = false})
        animateLabel()
    }
    
    @IBAction func closeView(_ sender: Any) {
        animateOut(completion: { () -> Void in blurView.isHidden = false})
    }
    
    func animateIn(completion: () -> Void) {
        self.view.addSubview(detailView)
        
        detailView.center = self.view.center
        detailView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        detailView.alpha = 1
        detailView.layer.cornerRadius = 20
        detailView.layer.shadowColor = UIColor.black.cgColor
        detailView.layer.shadowOpacity = 0.8
        detailView.layer.shadowRadius = 10
        detailView.layer.shadowOffset = CGSize(width: -1, height: 3)
        
        UIView.animate(withDuration: 0.4) {
            self.blurView.effect = self.effect
            self.detailView.alpha = 1
            self.detailView.transform = CGAffineTransform.identity
            self.detailView.layer.shadowColor = UIColor.clear.cgColor
            self.detailView.layer.shadowOpacity = 0
            self.detailView.layer.shadowRadius = 0
            self.detailView.layer.shadowOffset = CGSize(width: 0, height: 0)
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
    
    func animateLabel(){
        let animator = UIViewPropertyAnimator(duration: 0.6, curve: .easeOut) {
            self.bitcoinPriceLabel.center.x -= 20
//            self.textView.backgroundColor = .red
        }
        animator.startAnimation()
        
        print("A n i m a t e")
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
        
//        let nation = getFlags.setNation(row: row)
        flagImage.image = getFlags.flagImageArray[row]
//        let bitcoinPrice: String = networking.price
//        self.bitcoinPriceLabel.text = "Price: \(bitcoinPrice)"
////        let info = networking.getJSON()
//        self.textView.attributedText = prettyString(fromDictionary: networking.prettyText)
//        print(info)
    }
    
}

