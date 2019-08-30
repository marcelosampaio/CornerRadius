//
//  ViewController.swift
//  CornerRadius
//
//  Created by Marcelo Sampaio on 30/08/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - View Outlets
    @IBOutlet weak var topView: UIView!
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.topView.addShadow(shadowColor: .black, offSet: CGSize(width: 2.6, height: 2.6), opacity: 0.8, shadowRadius: 5.0, cornerRadius: 20.0, corners: [.topLeft, .bottomRight], fillColor: .red)
        
        
    }


}

