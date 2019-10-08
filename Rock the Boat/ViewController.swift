//
//  ViewController.swift
//  Rock the Boat
//
//  Created by Daniel Choi on 10/7/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boatImage: UIImageView!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var sun_cloudsStackView: UIStackView!
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showButton(false)
        sun_cloudsStackView.center.y = -300
        
        rockButton.setTitle(NSLocalizedString("str_rock", comment: ""), for: .normal)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //First animation: Alpha animation to fade into an UIImageview
        UIView.animate(withDuration: 2.5, animations: {
            self.boatImage?.alpha = 1.0
        })
        
        showButton(true)
        stackViewAnimation()
    }
    
    //Second animation: Positional, on a stack view
    func stackViewAnimation (){
        UIView.animate(withDuration: 2.0, delay: 1.0, animations: {
            self.sun_cloudsStackView.center.y = 64
        })
    }
    
    //Third animation: Three levels of nesting on an UIImageview
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.8, animations: {
            self.boatImage?.rotate(by: -Double.pi / 2, with: CGPoint(x: 0, y: 0))
        }, completion: { _ in
            
            UIView.animate(withDuration: 1.0, animations: {
                self.boatImage?.rotate(by: Double.pi / 2, with: CGPoint(x: 0, y: 0))
            }, completion: { _ in
                
                UIView.animate(withDuration: 1.0, animations: {
                    self.boatImage?.rotate(by: 0.0, with: CGPoint(x: 0, y: 0))
                })
            })
        })
    }
    
    //Fourth animation: Constraint
    func showButton(_ show: Bool) {
        let delay = show ? 1.0 : 0.0
        let yPos = show ? self.view.frame.height : -self.view.frame.height
        UIView.animate(withDuration: 2, delay: delay, options: [.curveEaseInOut], animations: {
            self.buttonBottomConstraint?.constant += yPos
            self.view.layoutIfNeeded()
        })
    }
    
}

