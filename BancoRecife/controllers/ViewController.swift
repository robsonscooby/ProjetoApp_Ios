//
//  ViewController.swift
//  BancoRecife
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 Cesar School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var usuario: String = ""
    var senha: String = ""
    var cliente = Cliente.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.isHidden = false
        
        entradas[0].text = cliente.getUsuario()
        entradas[1].text = cliente.getSenha()
        usuario = cliente.getUsuario()
        senha = cliente.getSenha()
        
    }
    
    @IBOutlet var entradas: [UITextField]!
    
    @IBOutlet weak var labelInvalido: UILabel!
    
    @IBAction func entrar(_ sender: UIButton) {

        if entradas[0].text != nil && entradas[0].text != "" && entradas[0].text == usuario && entradas[1].text == senha {
            labelInvalido.text = ""
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "tela_home") as? HomeViewController
            navigationController?.pushViewController(vc!,animated: true)
        } else {
            labelInvalido.text = "Usuário ou senha inválido!"
        }
        
    }
}

