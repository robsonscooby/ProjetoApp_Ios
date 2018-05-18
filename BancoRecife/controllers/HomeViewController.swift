//
//  HomeViewController.swift
//  BancoRecife
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 Cesar School. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cliente = Cliente.instance
    let stringRepository = Banco.instance

    @IBOutlet weak var labelSaldo: UILabel!
    
    @IBOutlet var operacoes: [UITextField]!
    
    @IBOutlet weak var minha_table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minha_table?.dataSource = self
        minha_table?.delegate = self
        labelSaldo.text = String(cliente.getSaldo())
    }

    @IBAction func depositar(_ sender: UIButton) {
        
        let saldo = (labelSaldo.text! as NSString).floatValue
  
        if operacoes[0].text! == "" {
            let alert = UIAlertController(title: "Transação", message: "Valor inválido!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                print("OK")
            }))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            var soma = (operacoes[0].text! as NSString).floatValue
            stringRepository.insert(value: String("Deposito: \(soma)"))
            soma = soma + saldo
            labelSaldo.text = String(soma)
            operacoes[0].text = ""
            
            let alert = UIAlertController(title: "Transação"
                , message: "Deposito realizado com sucesso!"
                , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in

            }))
            self.present(alert, animated: true, completion: nil)
            self.minha_table.reloadData()
        }
    }
    
    
    @IBAction func sacar(_ sender: UIButton) {
        let saldo = (labelSaldo.text! as NSString).floatValue
        
        if operacoes[1].text! == "" {
            let alert = UIAlertController(title: "Transação", message: "Valor inválido!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                print("OK")
            }))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            var soma = (operacoes[1].text! as NSString).floatValue
            stringRepository.insert(value: String("Saque: -\(soma)"))
            soma = saldo - soma
            labelSaldo.text = String(soma)
            operacoes[1].text = ""
            
            let alert = UIAlertController(title: "Transação"
                , message: "Saque realizado com sucesso!"
                , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            }))
            self.present(alert, animated: true, completion: nil)
            self.minha_table.reloadData()
        }
    }
    
    
    @IBAction func finalizar(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Extrato"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringRepository.size()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "minha_celula", for: indexPath)
        let stringValue = stringRepository.get(at: indexPath.row)
        cell.textLabel?.text = stringValue
        cell.detailTextLabel?.text = "No detail"
        return cell
    }

}
