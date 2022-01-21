//
//  File.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/21.
//

import Foundation
import UIKit

class NavigationTransition: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
    var originFrame: CGRect
    
    init(originFrame: CGRect) {
        self.originFrame = originFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toView = transitionContext.view(forKey: .to)
        else { return }
        
        let toViewOrigin = toView.layer.frame
        
        toView.frame = CGRect(x: originFrame.maxX, y: originFrame.minY, width: toViewOrigin.width, height: toViewOrigin.height)
        toView.transform = CGAffineTransform(translationX: self.originFrame.origin.x, y: self.originFrame.origin.y)
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(toView)
        

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            toView.transform = .identity
            toView.alpha = 1 })
        {
            _ in toView.translatesAutoresizingMaskIntoConstraints = false
            toView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            toView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            toView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            toView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            UIView.animate(withDuration: 1)
            {
                containerView.layoutIfNeeded()
            }
        }
        
        transitionContext.completeTransition(true)
    }
}
