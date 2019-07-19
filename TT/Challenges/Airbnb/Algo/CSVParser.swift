//
//  CSVParser.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation


//let csvParserTests = [
//"""Weronika,Zaborska,njkfdsv@dsgfk.sn,"running, sci-fi",new,Krakow,25""",
//"""Ryuichi,Akiyama,jkg@ljnsfd.fjn,"music,guide",Tokyo,65""",
//"""Elena,Martinez,emrt@lsofnbr.rt,"cooking, traveling",superhost,Valencia,42""",
//"""John,Mo,Smith,sfn@flkaei.km,biking and hiking,,"Seattle, WA",23"""]

func parseCSV(_ input: String) -> String {

    let arr = input.map { String($0) }
    var outputArr: [String] = []
    var outputStr = ""
    let quote = "\""
    let comma = ","

    var inQuote = false
    
    guard !input.isEmpty else { return input }
    
    func addOutput () {
        outputArr.append(outputStr)
        outputStr = ""
    }

    for (i, str) in arr.enumerated() {
        if inQuote {

            if str == quote {
                if ( i + 1 < arr.count && arr[i + 1] == quote ) {
                    outputStr += quote
                }

                else {
                    inQuote = false

                    if (i == arr.count - 1) {

                        addOutput ()
                    }
                }
            }

            else {
                outputStr += str
            }
        }

        else {

            if str == quote {
                inQuote = true
            }

            else if (str == comma) {

                addOutput ()

            }

            else {

                outputStr += str

                if i == arr.count - 1 {
                    addOutput ()
                }
            }
        }
    }
    

    
    print(outputArr)

    let firstName = outputArr.first!
    let age = outputArr.last!
    let place = outputArr[5]
    let interests = outputArr[3]
    
    return "\(firstName), \(age) years old, is from \(place) and is interested in \(interests)."

}

//O(n) Time
//O(n) Space

//My method, doesn't work for last case
func parseCSV2(_ input: String) -> String {
    
    guard !input.isEmpty else { return input }
    
    var inputArray = input.components(separatedBy: ",")
    var frontInfo: [String] = []
    var backInfo: [String] = []
    var interests = ""
    
    //O(n)
    for _ in 0...2 {
        frontInfo.append(inputArray.removeFirst())
    }
    
    //O(n)
    for _ in 0...2 {
        backInfo.append(inputArray.removeLast())
    }
    
    //O(n)
    for (i, word) in inputArray.enumerated() {
        
        let interest = word.replacingOccurrences(of: "\"", with: "").trimmingCharacters(in: CharacterSet.whitespaces)
        
        if i == 0 {
            interests += interest
        }
        
        else {
            interests += ", \(interest)"
        }
        
//        else if i != inputArray.count - 1 {
//            interests += ", \(interest)"
//        }
//
//        else {
//            interests += ", and \(interest)"
//        }
    }
    
    print(frontInfo)
    print(backInfo)
    print(inputArray)
    
    let firstName = frontInfo.first!
    let age = backInfo.first!
    let place = backInfo[1]
    
    return "\(firstName), \(age) years old, is from \(place) and is interested in \(interests)."
}
