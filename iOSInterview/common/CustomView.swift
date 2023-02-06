
import Foundation
import UIKit


class DotView : UIView {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setRadius()
    }
    
}

extension UIView {
    
    func addBorder(){
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
    func removeBorder(){
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
    }
    func setRadius(){
        self.layer.cornerRadius = self.bounds.width / 2.0
    }
    func setLineLayer( cgStart :CGPoint , cgEnd :CGPoint , color :UIColor){ //畫直線
        let linepath = UIBezierPath()
        let lineLayer = CAShapeLayer()
        linepath.move(to: cgStart)
        linepath.addLine(to: cgEnd)
        
        lineLayer.path = linepath.cgPath
        lineLayer.fillColor = nil
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = color.cgColor
        
        self.layer.addSublayer(lineLayer)
    }
    
}
