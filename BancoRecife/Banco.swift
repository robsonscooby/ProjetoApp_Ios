//
//  Banco.swift
//  BancoRecife
//
//  Created by aluno on 16/05/18.
//  Copyright © 2018 Cesar School. All rights reserved.
//

import Foundation

class Banco {
    
    private var listOfStrings : [String] = []
    
    private static var singleton: Banco?
    
    static var instance: Banco {
        get {
            if singleton == nil {
                singleton = Banco()
            }
            return singleton!
        }
    }
    
    func size() -> Int {
        return listOfStrings.count
    }
    
    func insert(value: String){
        listOfStrings.append(value)
    }
    
    func remove(at index: Int) -> String {
        return listOfStrings.remove(at: index)
    }
    
    func get(at index: Int) -> String {
        return listOfStrings[index]
    }
}

