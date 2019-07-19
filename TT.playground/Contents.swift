import UIKit

enum Anchor {
    case top, left, bottom, right, centerX, centerY
}

extension UIView {
    
    func align(_ anchor: Anchor, to relativeView: UIView?) -> UIView {
        
        guard let relativeView = relativeView else { return self }
        
        let siblingFrame = relativeView.convert(relativeView.frame, to: self.superview)
        
        switch anchor {
            
        case .left:
            self.frame.origin.x = siblingFrame.origin.x
            
            
        case .right:
            self.frame.origin.x = siblingFrame.origin.x + siblingFrame.size.width - self.frame.size.width
            
        case .top:
            self.frame.origin.y = siblingFrame.origin.y
            
        case .bottom:
            self.frame.origin.y = siblingFrame.origin.y + siblingFrame.size.height - self.frame.size.height
            
        case .centerX:
            self.center.x = relativeView.center.x
            
            
        case .centerY:
            self.center.y = relativeView.center.y
            
        }
        
        return self
        
    }
    
}

//public func solution(_ T : [Int]) -> Int {
//    // write your code in Swift 4.2.1 (Linux)
//    let half = T.count / 2
//    let uniqueCandies = Set(T)
//    print(uniqueCandies)
//    
//    if half > uniqueCandies.count {
//        return uniqueCandies.count
//    }
//        
//    else {
//        return half
//    }
//}
//
//
//solution([3, 4, 7, 7, 6, 6])

//let dict: [String : Any] = [
//    "Key1" : "1",
//    "Key2" : [
//        "a" : "2",
//        "b" : "3",
//        "c" : [
//            "d" : "3",
//            "e" : [
//                "" : "1"
//            ]
//        ]
//    ]
//    ]
//
//func flattenDictionary(dict: Dictionary<String, Any>) -> Dictionary<String, String> {
//    // your code goes here
//
//    var outputDict: [String : String] = [:]
//
//    for (key, value) in dict {
//
//        if value is String {
//
//            outputDict[key] = value as? String
//            print(outputDict)
//            break
//
//        }
//
//        else if value is Int {
//
//            outputDict[key] = String(value as! Int)
//            print(outputDict)
//            break
//        }
//
//        else if value is [String : Any] {
//
//            let recursiveDict = flattenDictionary(dict: value as! [String : Any])
//
//            for (nestedKey, nestedValue) in recursiveDict {
//
//                let newKey = nestedKey + "." + nestedValue
//
//                outputDict[newKey] = nestedValue
//                print(outputDict)
//
//            }
//
//        }
//    }
//
//    return outputDict
//}
//
//flattenDictionary(dict: dict)

print("\"")
