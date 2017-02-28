import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var nameAlbum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure (info: Structurs.album){
        imageAlbum.kf.setImage(with: URL(string: info.albumPhoto))
        nameAlbum?.text = info.albumName
        imageAlbum.layer.cornerRadius = 30.0
        imageAlbum.clipsToBounds = true
    }
    
}
