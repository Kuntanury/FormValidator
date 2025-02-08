//
//  FormViewModel.swift
//  FormValidator
//
//  Created by Kayden on 2025/2/8.
//

import Combine

class FormViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @Published private(set) var isEmailValid = false
    @Published private(set) var isPasswordValid = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $email
            .map { $0.contains("@") && $0.contains(".") }
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellables)
        
        $password
            .map { $0.count >= 8 }
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellables)
    }
}
