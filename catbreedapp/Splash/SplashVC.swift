//
//  SplashVC.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//


import UIKit

class SplashVC: UIViewController {
    private var window: UIWindow?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSplashLbl()
    }
    
    private func updateSplashLbl() {
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            let vc = HomeVC(nibName: "HomeVC", bundle: nil)
            let navController = UINavigationController(rootViewController: vc)
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = navController
            self.window?.makeKeyAndVisible()
        }
    }
}
