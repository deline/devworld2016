//
//  SecondController.swift
//  DevWorld2016
//
//  Created by development on 6/30/16.
//
//


import Foundation
import UIKit

public class SecondController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalTransitionStyle = .flipHorizontal
        
        self.view.backgroundColor = .white()
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        backButton.backgroundColor = .red()
        backButton.setTitle("BK", for: UIControlState())
        backButton.addTarget(self, action: #selector(SecondController.pop), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        
        self.title = "Second controller"
    }
    
    func pop() {
        self.dismiss(animated: true, completion: nil)
    }
}
