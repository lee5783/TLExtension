//
//  UIViewController+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension UIViewController {
    public func displayContentController(containerView: UIView, controller: UIViewController) {
        self.addChildViewController(controller)
        controller
            .view.frame = containerView.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        controller.view.translatesAutoresizingMaskIntoConstraints = true
        containerView.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    public func hideContentController(controller: UIViewController) {
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    
    public func presentModalControllerWithAnimationPush(controller: UIViewController, completion: (() -> Void)?) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.fillMode = kCAFillModeBoth
        controller.modalPresentationStyle = .fullScreen
        self.view.window!.backgroundColor = UIColor.clear
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.present(controller, animated: false, completion: completion)
    }
    
    public func dismissModalControllerWithAnimationPop(controller: UIViewController, completion: (() -> Void)?) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        transition.fillMode = kCAFillModeBoth
        controller.view.window!.backgroundColor = UIColor.clear
        controller.view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: false, completion: completion)
    }
}
