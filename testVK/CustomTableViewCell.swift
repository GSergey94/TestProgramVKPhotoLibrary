import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var nameAlbum: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
