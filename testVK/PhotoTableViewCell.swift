import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var namePhoto: UILabel!
    @IBOutlet weak var datePhoto: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imagePhoto.layer.cornerRadius = 30.0
        imagePhoto.clipsToBounds = true

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure (info: photo){
        imagePhoto.kf.setImage(with: URL(string: info.miniPhotoReference))
        namePhoto?.text = info.photoName
        datePhoto?.text = info.photoDate
            }
    
}
