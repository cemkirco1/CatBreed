//
//  UIViewController+Ext.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//
import Foundation
import UIKit

extension UIViewController {
    func animateNavigate(vc: UIViewController) {
        UIView.beginAnimations("Showinfo", context: nil)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationDuration(0.75)
        self.navigationController?.pushViewController(vc, animated: true)
        if let view = navigationController?.view {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: false)
        }
    }
}
