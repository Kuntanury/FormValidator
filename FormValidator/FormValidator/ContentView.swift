//
//  ContentView.swift
//  FormValidator
//
//  Created by Kayden on 2025/2/8.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = FormViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("用户注册")
                .font(.title.bold())
            
            TextField("邮箱", text: $vm.email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
            
            SecureField("密码", text: $vm.password)
                .textFieldStyle(.roundedBorder)
            
            VStack(alignment: .leading) {
                ValidationIndicator(condition: vm.isEmailValid, text: "邮箱格式正确")
                ValidationIndicator(condition: vm.isPasswordValid, text: "密码至少8位")
            }
            
            Button("提交") {
                
            }
            .buttonStyle(.borderedProminent)
            .disabled(!(vm.isEmailValid && vm.isPasswordValid))
            
        }
        .padding()
    }
}

struct ValidationIndicator: View {
    let condition: Bool
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: condition ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(condition ? .green : .red)
            
            Text(text)
                .foregroundColor(condition ? .green : .red)
        }
        .font(.caption)
        .transition(.opacity.combined(with: .slide))
        .animation(.spring(response: 0.3), value: condition)
    }
}

//#Preview {
//    ContentView()
//}
