//
//  UIViewController+PresentFollowOptions.swift
//
//
//  Created by John Brayton on 2/2/24.
//

#if canImport(UIKit)
import UIKit
import SafariServices

extension UIViewController {
    
    public func FOL_handleFollowOnFediverse( title: String ) {
        guard let fediverseProfile = FOLFollow.fediverseProfile else {
            print("FOLFollow.fediverseProfile is not set.")
            return
        }
        let options = FOLFediverseClientUtilities.options(forFediverseProfile: fediverseProfile)
        self.present(title: title, options: options)
    }
    
    public func FOL_handleBlog( title: String ) {
        guard let feedProfile = FOLFollow.feedProfile else {
            print("FOLFollow.feedProfile is not set.")
            return
        }
        let options = FOLFeedReaderUtilities.options(forFeedProfile: feedProfile)
        self.present(title: title, options: options)
    }
    
    private func present( title: String, options: [FOLOption] ) {
        let optionTableViewController = FOLOptionTableViewController(title: title, options: options, needsCloseButton: self.navigationController == nil)
        if let navigationController = self.navigationController {
            navigationController.pushViewController(optionTableViewController, animated: true)
        } else {
            let navigationController = UINavigationController(rootViewController: optionTableViewController)
            self.present(navigationController, animated: true)
        }
    }
    
}

#endif
