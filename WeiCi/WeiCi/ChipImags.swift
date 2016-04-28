//
//  ChipImags.swift
//  WeiCi
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

final class ChipImages {
    var cellImage:UIImage!
    
    var whiteChipWithLight:UIImage!
    var whiteCIChipWithLight: CIImage!
    var blackChipWithLight: UIImage!
    var blackCIChipWithLight: CIImage!
    
    private let size = CGSize(width: 100, height: 100)
    
    private func chipWithLight(color: UIColor) -> UIImage {
        func handler(rect: CGRect) -> Bool {
            let circlePath = UIBezierPath(ovalInRect: rect)
            let startColor: UIColor = (color == UIColor.whiteColor()) ? UIColor.lightGrayColor() : UIColor.blackColor()
            let endColor: UIColor = (color == UIColor.whiteColor()) ? UIColor.whiteColor() : UIColor.lightGrayColor()
            
//            let gradient = CAGradientLayer
            let center = CGPoint(x:rect.midX, y:rect.midY)
            let lightPoint = CGPoint(x:center.x + (rect.width/10), y:center.y + (rect.height/10))
            
        }
    }
}
