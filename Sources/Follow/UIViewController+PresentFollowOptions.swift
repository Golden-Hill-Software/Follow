//
//  UIViewController+PresentFollowOptions.swift
//
//
//  Created by John Brayton on 2/2/24.
//

#if canImport(UIKit)
import UIKit
import Follow
import SafariServices

extension UIViewController {
    
    public func FOL_handleFollowOnFediverse( fromSourceView sourceView: UIView, rect: CGRect ) {
        guard let fediverseProfile = FOLFollow.fediverseProfile else {
            print("FOLFollow.fediverseProfile is not set.")
            return
        }
        #warning("this is slow on iPhone. see what I can do about this.")
        let options = FOLFediverseClientUtilities.options(forFediverseProfile: fediverseProfile)
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for option in options {
            switch option {
            case .action(let name, let action):
                alertController.addAction(UIAlertAction(title: name, style: .default, handler: { (_) in
                    switch action {
                    case .copy(let string):
                        UIPasteboard.general.string = string
                    case .open(let url, _):
                        if let scheme = url.scheme?.lowercased(), ["http","https"].contains(scheme) {
                            let safariViewController = SFSafariViewController(url: url)
                            self.present(safariViewController, animated: true)
                        } else {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }))
            default:
                break
            }
        }
        alertController.addAction(UIAlertAction(title: String.localizedStringWithFormat("Cancel"), style: .cancel))
        alertController.popoverPresentationController?.sourceView = sourceView
        alertController.popoverPresentationController?.sourceRect = rect
        self.present(alertController, animated: true)
    }
    
}

#endif