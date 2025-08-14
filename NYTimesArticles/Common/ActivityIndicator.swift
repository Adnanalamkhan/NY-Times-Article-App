//
//  ActivityIndicator.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//
import Foundation
import UIKit

/// A UI utility that manages the display of a fullscreen loading indicator.
///
/// This class uses a singleton pattern (`Indicator.shared`) and should be called
/// from the main thread only. Marked with `@MainActor` to enforce UI thread safety.
@MainActor
final class Indicator {
    
    private var containerView = UIView()
    private var progressView = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    
    static let shared: Indicator = Indicator()
    
    func showProgressView() {
        guard let view = UIApplication.shared.topViewController()?.view else { return }
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor(hex: 0x949494, alpha: 1.0)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = view.center
        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2,
                                           y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
        
    }
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
