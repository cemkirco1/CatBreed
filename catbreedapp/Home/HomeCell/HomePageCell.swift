//
//  HomePageCell.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//
import UIKit
import Kingfisher

class HomePageCell: UITableViewCell {

    @IBOutlet weak var starBttn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var didSelect: () -> ()  = { }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(breed: BreedsResponse?) {
        if let img = breed?.image?.url {
            let url = URL(string: img)
            imgView.kf.setImage(with: url)
        }
        
        if let name = breed?.name {
            nameLbl.text = name
        }
    }
    
    @IBAction func addFavoriteBttn(_ sender: Any) {
        didSelect()
    }
    
}
