import UIKit
import Foundation

extension  UITabBar {

  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
  }

  func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
    self.layer.shadowColor = color.cgColor
    self.layer.shadowOffset = offset
    self.layer.shadowRadius = radius
    self.layer.shadowOpacity = opacity
  }

}
