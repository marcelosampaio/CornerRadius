//
//  UIView+Utils.swift
//  CornerRadius
//
//  Created by Marcelo Sampaio on 30/08/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import UIKit


extension UIView {
    
    
    
    // MARK: - Alert Controller
    func alert(msg: String, sender: UIViewController) {
        let alertController = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
        }
        alertController.addAction(okAction)
        sender.present(alertController, animated: true) {
        }
    }
    
    
    // MARK: - HUD
    func showActivityLoading() {
        let shadowView = UIView(frame:CGRect(x: 0, y:0, width: 90, height:90))
        shadowView.center = self.center
        shadowView.layer.cornerRadius = 8
        shadowView.layer.masksToBounds = true
        
        shadowView.tag = -998;
        shadowView.backgroundColor = UIColor.darkGray
        
        
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activity.center = self.center
        activity.tag = -999
        
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(shadowView)
        
        self.addSubview(shadowView)
        self.addSubview(activity)
        activity.startAnimating()
    }
    
    func hideActivityLoading() {
        DispatchQueue.main.async {
            self.alpha = 1.0
            self.viewWithTag(-998)?.removeFromSuperview()
            self.viewWithTag(-999)?.removeFromSuperview()
        }
    }
    
    // MARK: - Shadows Helper
    func addShadow(shadowColor: UIColor, offSet: CGSize, opacity: Float, shadowRadius: CGFloat, cornerRadius: CGFloat, corners: UIRectCorner, fillColor: UIColor = .white) {
        
        let shadowLayer = CAShapeLayer()
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let cgPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size).cgPath //1
        shadowLayer.path = cgPath //2
        shadowLayer.fillColor = fillColor.cgColor //3
        shadowLayer.shadowColor = shadowColor.cgColor //4
        shadowLayer.shadowPath = cgPath
        shadowLayer.shadowOffset = offSet //5
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        self.layer.addSublayer(shadowLayer)
        
        
        /* how to use it
         self.myView.addShadow(shadowColor: .black, offSet: CGSize(width: 2.6, height: 2.6), opacity: 0.8, shadowRadius: 5.0, cornerRadius: 20.0, corners: [.topRight, .topLeft], fillColor: .red)
         */
    }
}
