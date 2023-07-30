//
//  String+Extension.swift
//  emailValidateTask
//
//  Created by Сергей Сырбу on 30.07.2023.
//

import Foundation

extension String { // проверка валидации
    enum ValidTypes{
        case email
    }
    
    enum Regex: String {
        case email  = "[a-zA-Z0-9._]+@[a-z0-9._]+\\.[a-zA-Z]{2,64}"
    }
     
    func isValid(validType: ValidTypes)->Bool{
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType{
            
        case .email:
            regex = Regex.email.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
