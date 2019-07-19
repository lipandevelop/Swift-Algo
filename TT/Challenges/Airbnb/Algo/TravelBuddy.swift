//
//  TravelBuddy.swift
//  TT
//
//  Created by Li Pan on 2019-03-22.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//You have a list of cities you'd like to visit
//Your friends have cities they'd like to visit
//If >= 50% of your cities match your friends cities, they become a travel buddy
//Q1: given a list of friends and cities they'd like to visit, generate a list of friends who are your travel buddies, ranked from most to least
//Q2: recommend a list of cities that are on your travel buddies' list that aren't on yours

class Buddy {
    
    var name: String
    var similarity: Int
    var cities: Set<String>
    
    init (name: String, similarity: Int, cities: Set<String>) {
        self.name = name
        self.similarity = similarity
        self.cities = cities
    }
}

//Q1
//O(n^2)
func getBuddies(myCities: Set<String>, friendCities: [String: Set<String>]) -> [Buddy] {
    
    var buddies = [Buddy]()
    
    guard !myCities.isEmpty || !friendCities.isEmpty else { return buddies }
    
    //O(n^2)
    for friendCity in friendCities {
        
        let name = friendCity.key
        let cities = friendCity.value
        
        //O(n)
        let commonCities = myCities.intersection(cities)
        
        if commonCities.count * 2 >= myCities.count {
            print("my cities: ", myCities)
            print(name, "'s cities: ", cities)
            print("common cities: ", commonCities)
            print(name, "\(commonCities.count) is greater than or equal to half of, \(myCities.count)")
            print("------------------------------")
            buddies.append(Buddy(name: name, similarity: commonCities.count, cities: cities))
        }
        
    }
    
    //O(n log n)
    return buddies.sorted { $0.similarity > $1.similarity }
    
}

//Q2
//O(n^2)
func recommend(_ count: Int, myCities: Set<String>, buddies: [Buddy]) -> Set<String>{
    
    var recommended = Set<String>()
    
    //O(n^2)
    for buddy in buddies {
        
        //O(n)
        for city in buddy.cities {
            
            //O(1)
            if !myCities.contains(city) {
                recommended.insert(city)
            }
        }
    }
    
    return recommended
}

/* TravelBuddies Test, paste into viewDidLoad */

//let myCities: Set<String> = ["a", "b", "c", "d"]
//
//let friendCities: [String : Set<String>] = [ "f1" : ["a", "b", "e", "f"],
//                                             "f2" : ["a", "b", "d", "g"],
//                                             "f3" : ["x", "b", "a", "d", "q"],
//                                             "f4" : ["a", "b", "c", "d", "p", "q"],
//                                             "f5" : ["a", "x", "y", "z"]]
//
//let buddies = getBuddies(myCities: myCities, friendCities: friendCities)
//let recommendation = recommend(5, myCities: myCities, buddies: buddies)
//
//for buddy in buddies {
//    print(buddy.name)
//}
//print(recommendation)
