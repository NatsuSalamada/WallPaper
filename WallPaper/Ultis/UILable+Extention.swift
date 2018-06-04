//
//  UILable+Extention.swift
//  Fake
//
//  Created by Bé Nhện Của Bé Thảo on 16/04/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class DesignableLabel: UILabel {
    

    
    @IBInspectable var fontIPhone: CGFloat = 0{
        didSet {
            if UIScreen.main.bounds.width >= 768{
                
                self.font = UIFont(name: self.font.fontName, size: fontIPad)
               
            }else{
                
                self.font = UIFont(name: self.font.fontName, size: WIPH(w: fontIPhone))
            }
        }
    }
    @IBInspectable var fontIPad: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.width >= 768{
                
                self.font = UIFont(name: self.font.fontName, size: WIPA(w: fontIPad))
            }else{
                
                self.font = UIFont(name: self.font.fontName, size: fontIPhone)
                
            }
        }
    }
    
}
