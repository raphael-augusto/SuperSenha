//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Raphael Augusto Gonzaga on 21/05/22.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    @IBOutlet weak var button: UIButton!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int  = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        button.layer.cornerRadius = 10.0
        tvPasswords.layer.cornerRadius = 5.0
        
        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
    }
    
    
    func generatePasswords() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    

    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    

    @objc func showMiracle() {
        let slideVC = OverlayView()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    
    
    @IBAction func onButton(_ sender: Any) {
        showMiracle()
    }
    
    
}


extension PasswordsViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
