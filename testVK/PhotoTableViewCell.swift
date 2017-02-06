import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var namePhoto: UILabel!
    @IBOutlet weak var datePhoto: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
