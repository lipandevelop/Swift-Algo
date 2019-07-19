//
//  Drag&Drop.swift
//  TT
//
//  Created by Li Pan on 2019-03-23.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import UIKit

// MARK : by overriding touches methods

let padding: CGFloat = 100
let itemDimension: CGFloat = 44.0

class DragAndDropViewController: UIViewController {
    
    var imageView: UIImageView!
    var trashView: UIImageView!
    
    var imageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRect(x: padding, y: padding, width: itemDimension, height: itemDimension))
        imageView.backgroundColor = .red
        
        view.addSubview(imageView)
        
        trashView = UIImageView(frame: CGRect(x: view.bounds.width - padding, y: view.bounds.height - padding, width: itemDimension, height: itemDimension))
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

// MARK : using panGestureRecognizer

//So that after letting go image snaps back to original position

class DraggableImageView: UIImageView {
    
    var originalCenter: CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.originalCenter = self.center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

class DragAndDropPanViewController: UIViewController {
    
    var trashImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        putTrashView()
        putImageView(frame: CGRect(x: padding, y: padding, width: itemDimension, height: itemDimension))
        putImageView(frame: CGRect(x: padding * 2 + 5, y: padding, width: itemDimension, height: itemDimension))
        putImageView(frame: CGRect(x: padding * 3 + 5, y: padding, width: itemDimension, height: itemDimension))
        
        
        putImageView(frame: CGRect(x: padding, y: padding * 2 + 5, width: itemDimension, height: itemDimension))
        putImageView(frame: CGRect(x: padding * 2 + 5, y: padding * 2 + 5, width: itemDimension, height: itemDimension))
        putImageView(frame: CGRect(x: padding * 3 + 5, y: padding * 2 + 5, width: itemDimension, height: itemDimension))
        
        
    }
    
    private func putTrashView() {
        trashImageView = UIImageView(frame: CGRect(x: view.bounds.width - padding, y: view.bounds.height - padding, width: itemDimension, height: itemDimension))
        trashImageView.backgroundColor = .black
        view.addSubview(trashImageView)
    }
    
    private func putImageView(frame: CGRect) {
        
        let imageView = DraggableImageView(frame: frame)
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .red
        view.addSubview(imageView)
        addPanGesture(imageView)
        
    }
    
    private func addPanGesture(_ imageView: UIImageView) {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panItem(sender:)))
        imageView.addGestureRecognizer(pan)
        
    }
    
    @objc private func panItem(sender: UIPanGestureRecognizer) {
        
        guard let itemView = sender.view as? DraggableImageView else { return }
        
        let translation = sender.translation(in: view)
        
        switch sender.state {
            
        case .began,
             .changed:
            
            itemView.center = CGPoint(x: itemView.center.x + translation.x, y: itemView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            
        case .ended:
            
            if itemView.frame.intersects(trashImageView.frame) {
                
                delete(itemView)
            }
                
            else {
                
                snapBack(itemView)
            }
            
        default:
            break
            
        }
    }
    
    private func delete(_ itemView: UIImageView) {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            itemView.alpha = 0.0
            
            
        }) { (complete) in
            
            if complete {
                itemView.removeFromSuperview()
            }
        }
    }
    
    private func snapBack(_ itemView: DraggableImageView) {
        
        UIView.animate(withDuration: 0.2) {
            itemView.center = itemView.originalCenter
        }
    }
}

