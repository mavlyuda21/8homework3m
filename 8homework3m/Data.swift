//
//  Data.swift
//  8homework3m
//
//  Created by mavluda on 1/4/23.
//

import Foundation

class Data{
    private var unsortedArray = [Contact]()
    
    func getCount() -> Int{
        return unsortedArray.count
    }
    
    func getModel(index: Int)->Contact{
        return unsortedArray.sorted { $0.name < $1.name}[index]
    }
    
    func addContact(name: String, number: String, image: String){
        unsortedArray.append(Contact(name: name, number: number, image: image))
    }
}

struct Contact{
    
    var name: String, number: String, image: String
}
