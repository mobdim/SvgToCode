//
//  StyleExtension.swift
//  SVGToSwift
//
//  Created by Le Quang on 4/16/20.
//  Copyright © 2020 Le Viet Quang. All rights reserved.
//

import Foundation

extension StyleSelector {
    func selectorName()->String{
        if let name = self.data?.value { return name }
        return ""
    }
}

extension Array where Element == Rule {
    
}
