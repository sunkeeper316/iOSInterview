import UIKit
import Foundation


class CustomTextField: UITextField {
    var gradientLayer :CAGradientLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let text = self.text {
            if text.count > 0 {
                if gradientLayer != nil {
                    layer.sublayers?.remove(at: 0)
                    gradientLayer = nil
                }
            }else{
                setGradientBackground(colors: [UIColor.white3 , UIColor.white2])
            }
        }else{
            setGradientBackground(colors: [UIColor.white3 , UIColor.white2])
        }
        
    }
    
    func setGradientBackground(colors: [UIColor]) {
        if gradientLayer == nil {
            gradientLayer = CAGradientLayer()
            gradientLayer.frame = bounds
            gradientLayer.colors = colors.map { $0.cgColor }
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            layer.insertSublayer(gradientLayer, at: 0)
        }
        
    }
}

