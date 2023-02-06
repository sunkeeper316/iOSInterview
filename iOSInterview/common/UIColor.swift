import UIKit
import Foundation



extension UIColor {
    
    public static let gray6 = UIColor(hex: "#6f6f6fff")! // CUBE_color/system/gray6
    public static let gray500 = UIColor(hex: "#888888FF")! //Gray-500
    public static let gray1 = UIColor(hex: "#fafafaff")! //CUBE_color/system/gray1
    public static let gray5 = UIColor(hex: "#888888ff")! //CUBE_color/system/gray5
    public static let white2 = UIColor(hex: "#fbfbfbff")! //white - Two
    public static let white3 = UIColor(hex: "#f0f0f0ff")! //white - Three
    public static let orange01 = UIColor(hex: "#ff8861ff")! //Orange01
    
    
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    func toHexString() -> String {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            getRed(&r, green: &g, blue: &b, alpha: &a)
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            return String(format:"#%06x", rgb)
    }
}
