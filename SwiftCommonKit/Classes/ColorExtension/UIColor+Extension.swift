//
//  UIColor+Extension.swift
//  ColorDemo
//
//  Created by luwei ma on 2020/6/5.
//  Copyright © 2020 luwei ma. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: - Dark style
    
    /// 适配黑暗模式
    /// - Parameters:
    ///   - lightColor: 普通模式下颜色
    ///   - darkColor: 黑暗模式下颜色
    /// - Returns: 展示的颜色
    open class func color(lightColor: UIColor, darkColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return lightColor
                }else {
                    return darkColor
                }
            }
        }
        return lightColor
    }
    
    
    
    /// 适配黑暗模式， 16 进制 转 UIColer
    /// - Parameters:
    ///   - lightHexColor: 普通模式下颜色
    ///   - darkHexColor: 黑暗模式下颜色
    /// - Returns: 展示的颜色
    open class func color(lightHexColor: String, darkHexColor: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor(hexString: lightHexColor)
                }else {
                    return UIColor(hexString: darkHexColor)
                }
            }
        }
        return UIColor(hexString: lightHexColor)
    }
    
    open class func color(lightHexColor: Int, darkHexColor: Int) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor(hex: lightHexColor)
                }else {
                    return UIColor(hex: darkHexColor)
                }
            }
        }
        return UIColor(hex: lightHexColor)
    }
    
    convenience init(lightHexColor: String, darkHexColor: String) {
        if #available(iOS 13.0, *) {
            self.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor(hexString: lightHexColor)
                }else {
                    return UIColor(hexString: darkHexColor)
                }
            }
        }
        self.init(hexString: lightHexColor)
    }
    
    convenience init(lightHexColor: Int, darkHexColor: Int) {
        if #available(iOS 13.0, *) {
            self.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor(hex: lightHexColor)
                }else {
                    return UIColor(hex: darkHexColor)
                }
            }
        }
        self.init(hex: lightHexColor)
    }

    
    // MARK: - Color init
    
    /// Hex color
    /// - Parameter hex: 16进制 字符串 & Int
    convenience init(hexString: String) {
        self.init(hexString: hexString, alpha: 1)
    }
    
    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1)
    }
    
    convenience init(hexString: String, alpha: CGFloat) {
        var hex = hexString
        hex = hex.replacingOccurrences(of: "0x", with: "")
        hex = hex.replacingOccurrences(of: "#", with: "")
        assert(hex.count == 6, "Invalid hexString component")
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0x0;
        scanner.scanHexInt64(&rgb)
        self.init(hex: Int(rgb), alpha: alpha)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            alpha: alpha
        )
    }
    
    
    
    /// RGB  color
    /// - Parameters:
    ///   - red: red
    ///   - green: green
    ///   - blue: blue
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: red, green: red, blue: blue, alpha: 1)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: alpha)
    }
    
}
