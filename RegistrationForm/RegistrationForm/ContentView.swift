//
//  ContentView.swift
//  RegistrationForm
//
//  Created by The YooGle on 29/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = UserRegistrationViewModel()
    
    let buttonGradient = LinearGradient(gradient:
        Gradient(
            colors: [
                Color(red: 251/255, green: 128/255, blue: 128/255),
                Color(red: 253/255, green: 193/255, blue: 104/255)
            ]
        ),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    var body: some View {
        VStack {
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            FormField(fieldName: "Username", value: $viewModel.username)
            RequirementText(
                iconColor: viewModel.isUsernameLengthValid ? Color.secondary : Color.red_1,
                text: "A minimum of 4 Characters",
                strikeThrough: viewModel.isUsernameLengthValid
            )
            .padding()
            
            FormField(fieldName: "Password", isSecure: true, value: $viewModel.password)
            VStack {
                RequirementText(
                    iconName: "lock.open",
                    iconColor: viewModel.isPasswordLengthValid ? Color.secondary : Color.red_1,
                    text: "A minimum of 8 Characters",
                    strikeThrough: viewModel.isPasswordLengthValid
                )
                RequirementText(
                    iconName: "lock.open",
                    iconColor: viewModel.isPasswordCapitalLetter ? Color.secondary : Color.red_1,
                    text: "One uppercase letter",
                    strikeThrough: viewModel.isPasswordCapitalLetter
                )
            }
            .padding()
            
            FormField(fieldName: "Confirm Password", isSecure: true, value: $viewModel.confirmPassword)
            RequirementText(
                iconColor: viewModel.isConfirmPasswordValid ? Color.secondary : Color.red_1,
                text: "Confirm password should be same as password.",
                strikeThrough: viewModel.isConfirmPasswordValid
            )
            .padding()
            .padding(.bottom, 50)
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(buttonGradient)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                
                Button {
                    
                } label: {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.red_1)
                }
            }
            .padding(.top, 50)
            
            Spacer()
        }
        .padding()
    }
}

struct FormField: View {
    
    var fieldName = ""
    var isSecure = false
    @Binding var value: String
    
    var body: some View {
        
        if isSecure {
            SecureField(fieldName, text: $value)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.horizontal)
        } else {
            TextField(fieldName, text: $value)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.horizontal)
        }
        
        Divider()
            .frame(height: 1)
            .background(Color(red: 240/255, green: 240/255, blue: 240/255))
            .padding(.horizontal)
    }
}

struct RequirementText: View {
    
    var iconName = "xmark.square"
    var iconColor = Color.red_1
    var text = ""
    var strikeThrough = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(strikeThrough)
            Spacer()
        }
    }
}

extension Color {
    
    static let red_1 = Color(red: 251/255, green: 128/255, blue: 128/255)
    
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
