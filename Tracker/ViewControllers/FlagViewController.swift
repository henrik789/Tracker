
import UIKit

class FlagViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var aniImages: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Animation show here."
        
        aniImages = createImageArray(total: 10, imagePrefix: "Idle")
        
    }
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage]{
        var imageArray: [UIImage] = []
        
        for imageCount in 1...total{
            print( "\(imagePrefix)\(imageCount)")
            let imageName = "\(imagePrefix)\(imageCount)"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
    }
    
    @IBAction func imageButton(_ sender: Any) {
        animate(imageView: imageView, images: aniImages)
    }
}
