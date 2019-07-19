//
//  ViewController.swift
//  DragAndDropImage
//
//  Created by Li Pan on 2019-03-18.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import UIKit

let itemDimension: CGFloat = 44.0

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var trashView: UIImageView!
    
    var imageSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: itemDimension, height: itemDimension))
        imageView.backgroundColor = .red
        
        view.addSubview(imageView)
        
        trashView = UIImageView(frame: CGRect(x: view.bounds.width - 100, y: view.bounds.height - 100, width: itemDimension, height: itemDimension))
        trashView.backgroundColor = .black
        
        view.addSubview(trashView)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        
        let touchPoint = touch.location(in: view)
        
        if imageView.frame.contains(touchPoint) {
            imageSelected = true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if imageView.frame.intersects(trashView.frame) {
            print("delete")
            imageView.removeFromSuperview()
        }
        
        else {
            imageSelected = false
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        
        let touchPoint = touch.location(in: view)
        
        imageView.center = touchPoint
        
    }
}

