//
//  ConfigViewController.swift
//  BancoRecife
//
//  Created by aluno on 15/05/18.
//  Copyright © 2018 Cesar School. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    var cliente = Cliente.instance

    @IBOutlet var entradas: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func confirmar(_ sender: UIButton) {
        cliente.saldo = (entradas[0].text! as NSString).floatValue
        cliente.usuario = entradas[1].text!
        cliente.senha = entradas[2].text!
        
        self.navigationController?.popViewController(animated: true)
    }

}
