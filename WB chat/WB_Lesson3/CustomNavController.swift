//
//  CustomNavController.swift
//  WB chat
//
//  Created by Sergey Savinkov on 09.06.2024.
//

import UIKit

class CustomNavController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let customTransition = CustomTransition()
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = customTransition as! any UIViewControllerTransitioningDelegate
        super.pushViewController(viewController, animated: animated)
    }
}
