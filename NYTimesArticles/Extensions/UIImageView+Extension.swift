//
//  UIImageView+Extension.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import Foundation
import UIKit

/// - Extension on UIImageView to add an asynchronous image loading function with caching.
/// - With static image cache to store images that have already been fetched from URLs.
/// - This helps in avoiding redundant network requests and improving performance.
/// - `MainActor` annotation ensures that UI updates happen on the main thread.
/// -
extension UIImageView {
    private static let imageCache = NSCache<NSString, UIImage>()
    
    @MainActor
    func setImage(from urlString: String?, placeholder: UIImage? = nil) async {
        guard let urlString = urlString,
                    !urlString.isEmpty,
                let url = URL(string: urlString) else {
            /// Optionally set placeholder or clear image if `URL` is invalid
            self.image = placeholder
            return
        }
        if let cacheImage = UIImageView.imageCache.object(forKey: urlString as NSString) {
            self.image = cacheImage
            return
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                UIImageView.imageCache.setObject(image, forKey: urlString as NSString)
                self.image = image
            }
        } catch {
            self.image = placeholder
        }
    }
}

extension UIImage {
    static var userPlaceholderImage: UIImage? { UIImage(systemName: "person.circle") }
}
