//
//  UIViewController+Extensions.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import Foundation
import UIKit

/// - Extension on UIViewController to add an alert function.
/// -
extension UIViewController {
    func alert(title: String = "", message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let OKAction = UIAlertAction(title: AppConstants.ok,
                                     style: .default,
                                     handler: nil)
        alertController.addAction(OKAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

/// - Extension on UIStoryboard to provide a generic method to instantiate a view controller.
/// - The method is generic, so it can instantiate any view controller type (T) that inherits from UIViewController.
/// -
extension UIStoryboard {
    static func instantiateViewController<T: UIViewController>(_ viewController: T.Type) -> T {
        let storyBoard = UIStoryboard(name: AppConstants.mainStoryBoard, bundle: nil)
        let identifier = String(describing: T.self)
        guard let controller = storyBoard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Not able to instantiate controller with identifier \(identifier).")
        }
        return controller
    }
}

/// - Extension on UIApplication for getting the Top View Controller.
/// -
extension UIApplication {
    func topViewController() -> UIViewController? {
        var topViewController: UIViewController?
        if #available(iOS 13, *) {
            for scene in connectedScenes {
                if let windowScene = scene as? UIWindowScene {
                    for window in windowScene.windows where window.isKeyWindow {
                        topViewController = window.rootViewController
                    }
                }
            }
        } else {
            topViewController = keyWindow?.rootViewController
        }
        while true {
            if let presented = topViewController?.presentedViewController {
                topViewController = presented
            } else if let navController = topViewController as? UINavigationController {
                topViewController = navController.topViewController
            } else if let tabBarController = topViewController as? UITabBarController {
                topViewController = tabBarController.selectedViewController
            } else {
                /// Handle any other third party container in `else if` if required
                break
            }
        }
        return topViewController
    }
}
