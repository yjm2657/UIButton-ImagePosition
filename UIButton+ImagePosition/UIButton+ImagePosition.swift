//
//  UIButton+ImagePosition.swift
//  UIButton+ImagePosition
//
//  Created by YJM on 2017/7/31.
//  Copyright © 2017年 YJM. All rights reserved.
//

import Foundation
import UIKit


enum ImagePosition: NSInteger{
    case left = 0
    case right = 1
    case top = 2
    case bottom = 3
}

extension UIButton{
    ///务必设置了图片才调用此方法
    func setImagePosition(position: ImagePosition, spacing: CGFloat) {
        
        self.setTitle(self.currentTitle, for: .normal)
        self.setImage(self.currentImage, for: .normal)
        
        let imageWidth:CGFloat = (self.imageView?.image?.size.width)!
        let imageHeight:CGFloat = (self.imageView?.image?.size.height)!
        
        let titleStr:NSString = (self.titleLabel?.text)! as NSString
        let font:UIFont = self.titleLabel!.font
        let attributes = [NSFontAttributeName:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = titleStr.boundingRect(with: CGSize(width: LONG_MAX, height: LONG_MAX), options: option, attributes: attributes , context: nil)
        
        let labelWidth:CGFloat = rect.width
        let labelHeight:CGFloat = rect.height
        
        let imageOffsetX:CGFloat = (imageWidth + labelWidth) / 2.0 - imageWidth/2.0
        let imageOffsetY:CGFloat = imageHeight / 2.0 + spacing / 2.0
        let labelOffsetX:CGFloat = (imageWidth + labelWidth / 2.0) - (imageWidth + labelWidth)/2.0
        let labelOffsetY:CGFloat = labelHeight / 2.0 + spacing / 2.0
        
        let tempWidth:CGFloat = max(labelWidth, imageWidth)
        let changedWidth:CGFloat = labelWidth + imageWidth - tempWidth
        let tempHeight:CGFloat = max(labelHeight, imageHeight)
        let changedHeight:CGFloat = labelHeight + imageHeight + spacing - tempHeight
        
        switch position {
        case .left:
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2.0, bottom: 0, right: spacing/2.0)
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2.0, bottom: 0, right: -spacing/2.0)
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2.0, bottom: 0, right: spacing/2.0)
            break
        case .right:
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + spacing/2.0, bottom: 0, right: -(labelWidth + spacing / 2.0))
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + spacing/2), bottom: 0, right: imageWidth + spacing/2)
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2.0, bottom: 0, right: spacing/2.0)
            break
        case .top:
            self.imageEdgeInsets = UIEdgeInsets(top: -imageOffsetY, left: imageOffsetX, bottom: imageOffsetY, right: -imageOffsetX)
            self.titleEdgeInsets = UIEdgeInsets(top: labelOffsetY, left: -labelOffsetX, bottom: -labelOffsetY, right: labelOffsetX)
            self.contentEdgeInsets = UIEdgeInsets(top: imageOffsetY, left: -changedWidth/2, bottom: changedHeight-imageOffsetY, right: -changedWidth/2)
            break
        case .bottom:
            self.imageEdgeInsets = UIEdgeInsets(top: imageOffsetY, left: imageOffsetX, bottom: -imageOffsetY, right: -imageOffsetX)
            self.titleEdgeInsets = UIEdgeInsets(top: -labelOffsetY, left: -labelOffsetX, bottom: labelOffsetY, right: labelOffsetX)
            self.contentEdgeInsets = UIEdgeInsets(top: changedHeight-imageOffsetY, left: -changedWidth/2, bottom: imageOffsetY, right: -changedWidth/2)
            break
        }
    }
}
