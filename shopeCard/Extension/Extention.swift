//
//  Extention.swift
//  shopeCard
//
//  Created by SID on 02/10/2024.
//

import Foundation
import UIKit

extension UIView{
    
    func addRadiusAndShadow(_ radius : CGFloat){
        self.backgroundColor = .white
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = radius
        self.translatesAutoresizingMaskIntoConstraints = false
        addShadow(radius)
    }
    
    func addShadow(_ radius:CGFloat){
        let contentsLayer: UIView = {
            let view = UIView()
            view.layer.cornerRadius = radius
            view.layer.masksToBounds = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        self.insertSubview(contentsLayer, at: 0)
        NSLayoutConstraint.activate([
            ///Constrains your contentsLayer to the cardView
            contentsLayer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentsLayer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentsLayer.heightAnchor.constraint(equalTo: self.heightAnchor),
            contentsLayer.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
}
