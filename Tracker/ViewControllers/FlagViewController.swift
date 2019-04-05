
import UIKit

class FlagViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView!
    
    let flagView = GetDataFlags()
     var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Flag image show here."
        
    }
    
    @IBAction func imageButton(_ sender: Any) {
//        let nation = flagView.setNation(row: index)
        flagImage.image = flagView.flagImageArray[index]
        index += 1
        if index == 20{
            index = 0
        }
    }
}
