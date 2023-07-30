//
//  ViewController.swift
//  emailValidateTask
//
//  Created by Сергей Сырбу on 30.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let reqLabel: UILabel = {
        let label = UILabel()
        label.text = "Check your email"
        label.textColor = .white
        return label
    }()
    let emailTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email"
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        return textField
    }()
    
    let verificatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Verification", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.7133264605)
        button.layer.cornerRadius = 7
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initilization()
        
    }

    func initilization(){
   
    
        emailTF.delegate = self
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(200)
            make.height.equalTo(40)
            make.width.equalTo(350)
        }
        view.addSubview(reqLabel)
        reqLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalTo(emailTF.snp.top).offset(-10)
        }
        view.addSubview(verificatButton)
        verificatButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTF.snp.bottom).offset(30)
            make.height.equalTo(40)
            make.width.equalTo(350)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") + string
        let result: String
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        textField.text = result
        
        if result.isValid(validType: .email){
            reqLabel.text = "Email valid"
            reqLabel.textColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
            emailTF.layer.borderColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1).cgColor
            emailTF.layer.borderWidth = 3
        } else {
            reqLabel.text = "Email not valid. Enter example@domain.com"
            reqLabel.textColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
            emailTF.layer.borderColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1).cgColor
            emailTF.layer.borderWidth = 3
        }
        return false
    }
}
