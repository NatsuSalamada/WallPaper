//
//  UIView+Extention.swift
//  Fake
//
//  Created by Bé Nhện Của Bé Thảo on 16/04/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var xIphone: CGFloat {
        get {
            return frame.origin.x
            
        }
        set {
            if UIScreen.main.bounds.width >= 768{
                frame.origin.x = xIpad
            }else{
                frame.origin.x = WIPH(w: newValue)
            }
        }
    }
    @IBInspectable var yIphone: CGFloat {
        get {
            return frame.origin.y
            
        }
        set {
            if UIScreen.main.bounds.height >= 1024{
                frame.origin.y = yIpad
            }else{
                frame.origin.y = HIPH(h: newValue)
            }
        }
    }
    @IBInspectable var widthIphone: CGFloat {
        get {
            return frame.size.width
            
        }
        set {
            if UIScreen.main.bounds.width >= 768{
                frame.size.width = widthIpad
            }else{
                frame.size.width = WIPH(w: newValue)
            }
        }
    }
    @IBInspectable var heightIphone: CGFloat {
        get {
            return frame.size.height
            
        }
        set {
            if UIScreen.main.bounds.height >= 1024{
                frame.size.height = heightIpad
            }else{
                frame.size.height = HIPH(h: newValue)
            }
        }
    }
    
    @IBInspectable var xIpad: CGFloat {
        get {
            return frame.origin.x
            
        }
        set {
            if UIScreen.main.bounds.width >= 768{
                frame.origin.x = WIPA(w: newValue)
            }else{
                frame.origin.x = xIphone
            }
        }
    }
    @IBInspectable var yIpad: CGFloat {
        get {
            return frame.origin.y
            
        }
        set {
            if UIScreen.main.bounds.height >= 1024{
                frame.origin.y = HIPA(h: newValue)
            }else{
                frame.origin.y = yIphone
            }
        }
    }
    @IBInspectable var widthIpad: CGFloat {
        get {
            return frame.size.width
            
        }
        set {
            if UIScreen.main.bounds.width >= 768{
                frame.size.width = WIPA(w: newValue)
            }else{
                frame.size.width = widthIphone
            }
        }
    }
    @IBInspectable var heightIpad: CGFloat {
        get {
            return frame.size.height
            
        }
        set {
            if UIScreen.main.bounds.height >= 1024{
                frame.size.height = HIPA(h: newValue)
            }else{
                frame.size.height = heightIphone
            }
        }
    }
}
