//
//  CustomTransition.swift
//  WB chat
//
//  Created by Sergey Savinkov on 09.06.2024.
//

import UIKit

class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5 // длительность перехода
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // код анимации перехода
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!

        // анимация перехода
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            // измените свойства view, чтобы создать анимацию
            fromView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            toView.transform = CGAffineTransform.identity
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
