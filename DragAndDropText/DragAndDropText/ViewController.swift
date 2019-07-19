//
//  ViewController.swift
//  DragAndDropText
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import UIKit

let cellIdentifier = "textCell"

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    private var selectedString: String?
    private var texts = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.textDragDelegate = self
        tableView.dropDelegate = self
        tableView.dataSource = self

    }


}

extension ViewController: UITableViewDropDelegate, UITextDragDelegate {
    
    
    func textDraggableView(_ textDraggableView: UIView & UITextDraggable, dragPreviewForLiftingItem item: UIDragItem, session: UIDragSession) -> UITargetedDragPreview? {
        
        if let image = LetterImageGenerator.imageWith(selectedString) {
            
            let imageView = UIImageView(image: image)
            let dragView = textDraggableView
            let dragCenter = session.location(in: dragView)
            
            let target = UIDragPreviewTarget(container: dragView, center: dragCenter)
            
            return UITargetedDragPreview(view: imageView, parameters: UIDragPreviewParameters(), target: target)
            
        }
        
        return nil
        
    }
    
    func textDraggableView(_ textDraggableView: UIView & UITextDraggable, itemsForDrag dragRequest: UITextDragRequest) -> [UIDragItem] {
        
        if let str = textView.text(in: dragRequest.dragRange) {
            self.selectedString = str
            return [UIDragItem(itemProvider: NSItemProvider(object: str as NSString))]
            
        }
        
        else {
            
            return []
        }
        
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        }
        
        else {
            
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        coordinator.session.loadObjects(ofClass: NSString.self) { (items) in
            
            guard let strings = items as? [String], !strings.isEmpty else { return }
            
            self.texts.insert(strings.first!, at: destinationIndexPath.row)
            
            self.tableView.insertRows(at: [destinationIndexPath], with: .automatic)
            
        }
        
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = texts[indexPath.row]
        
        return cell
    }
    
}

class LetterImageGenerator: NSObject {
    
    class func imageWith(_ text: String?) -> UIImage? {
        
        guard let selectedText = text else { return nil }
        
        let padding: CGFloat = 10
        let space = " "
        let nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .clear
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.text = space + selectedText + space
        nameLabel.sizeToFit()

        UIGraphicsBeginImageContext(CGSize(width: nameLabel.frame.size.width, height: nameLabel.frame.size.height + padding))
        if let currentContext = UIGraphicsGetCurrentContext() {
            nameLabel.layer.render(in: currentContext)
            let nameImage = UIGraphicsGetImageFromCurrentImageContext()
            return nameImage
        }
        return nil
    }
}



