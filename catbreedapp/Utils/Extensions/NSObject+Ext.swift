//
//  NSObject+Ext.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
