//
//  DetailVC.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//
import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var descTxtView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var lifeLbl: UILabel!
    @IBOutlet weak var temperamentLbl: UILabel!
    
    
    
    var vm : DetailVM?
    
    var response : BreedsResponse? {
        didSet {
            setupUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        vm?.delegate = self
        vm?.getResponse()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func vcaBttnClicked(_ sender: Any) {
        UIApplication.shared.open(NSURL(string: "\(response?.vcahospitals_url ?? "")")! as URL)

    }
    
    @IBAction func cfaBttnClicked(_ sender: Any) {
        UIApplication.shared.open(NSURL(string: "\(response?.cfa_url ?? "")")! as URL)

    }
    
    @IBAction func wikiBttnClicked(_ sender: Any) {
        UIApplication.shared.open(NSURL(string: "\(response?.wikipedia_url ?? "")")! as URL)

    }
    
    @IBAction func vetBttnClicked(_ sender: Any) {
        UIApplication.shared.open(NSURL(string: "\(response?.vetstreet_url ?? "")")! as URL)

    }
    
    private func setupUI() {
        
        if let desc = response?.description {
            descTxtView.text = desc
        }
        
        if let origin = response?.origin {
            originLbl.text = origin
        }
        if let life = response?.life_span {
            lifeLbl.text = life
        }
        
        if let temperament = response?.temperament {
            temperamentLbl.text = temperament
        }

        if let image = response?.image?.url{
            let url = URL(string: image)
            imageView.kf.setImage(with: url)
        }
    }
}

extension DetailVC: DetailVMDelegate {
    func didGetBreed(breed: BreedsResponse?) {
        response = breed
    }
}
