//
//  UserRegistrationViewModel.swift
//  RegistrationForm
//
//  Created by The YooGle on 29/06/22.
//

import Foundation
import Combine

class UserRegistrationViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isConfirmPasswordValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $username
            .receive(on: RunLoop.main)
            .map { username in
                return username.count >= 4
            }
            .assign(to: \.isUsernameLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $confirmPassword)
            .receive(on: RunLoop.main)
            .map { (password, confirmPassword) in
                return !confirmPassword.isEmpty && (confirmPassword == password)
            }
            .assign(to: \.isConfirmPasswordValid, on: self)
            .store(in: &cancellableSet)
    }
    
}
