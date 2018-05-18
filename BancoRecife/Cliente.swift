//
//  Cliente.swift
//  BancoRecife
//
//  Created by aluno on 15/05/18.
//  Copyright © 2018 Cesar School. All rights reserved.
//

import Foundation

class Cliente {

    var usuario: String
    var senha: String
    var saldo: Float
    
    init() {
        self.usuario = ""
        self.senha = ""
        self.saldo = 0
    }
    
    func getSaldo() -> Float {
        return self.saldo
    }
    
    func getUsuario() -> String {
        return self.usuario
    }
    
    func getSenha() -> String {
        return self.senha
    }
    
    private static var singleton: Cliente?
    
    static var instance: Cliente {
        get {
            if singleton == nil {
                singleton = Cliente()
            }
            return singleton!
        }
    }
}

