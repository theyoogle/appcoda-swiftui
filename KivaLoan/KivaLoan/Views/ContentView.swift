//
//  ContentView.swift
//  KivaLoan
//
//  Created by The YooGle on 29/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loanStore = LoanStore()
    
    @State private var showFilter = false
    @State private var maxLoanAmount = 10000.0
    
    var body: some View {
        NavigationView {
            
            if self.showFilter {
                LoanFilterView(amount: $maxLoanAmount)
                    .transition(.opacity)
            }
            
            List(loanStore.loans) { loan in
                LoanCellView(loan: loan)
                    .padding(.vertical, 5)
            }
            .navigationBarTitle("Kiva Loan")
            .navigationBarItems(trailing:
                Button(action: {
                    withAnimation(.linear) {
                        self.showFilter.toggle()
                        self.loanStore.filterLoans(maxAmount: Int(self.maxLoanAmount))
                    }
                }) {
                    Text("Filter")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            self.loanStore.fetchLoans()
        }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
