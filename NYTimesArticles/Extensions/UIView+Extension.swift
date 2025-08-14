//
//  UIView+Extensions.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import Foundation
import UIKit

/// - Extension on UIView to add a method for setting the corner radius.
/// - The `radius` parameter defines the size of the rounded corners.
/// -
extension UIView {
    func addCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
