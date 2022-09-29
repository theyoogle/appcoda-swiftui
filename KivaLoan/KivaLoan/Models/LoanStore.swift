//
//  LoanStore.swift
//  KivaLoan
//
//  Created by The YooGle on 29/09/22.
//

import SwiftUI

class LoanStore: ObservableObject, Decodable {
    
    @Published var loans: [Loan] = []
    private var cachedLoans: [Loan] = []
    
    private static var API_URL = "https://api.kivaws.org/v1/loans/newest.json";
    
    enum CodingKeys: CodingKey {
        case loans
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loans = try values.decode([Loan].self, forKey: .loans)
    }
    
    init() {
        
    }
    
    func fetchLoans() {
        guard let url = URL(string: Self.API_URL) else { return }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    self.loans = self.parseJsonData(data: data)
                    self.cachedLoans = self.loans
                }
            }
        }
        
        task.resume()
    }
    
    func parseJsonData(data: Data) -> [Loan] {
        let decoder = JSONDecoder()
        
        do {
            let loanStore = try decoder.decode(LoanStore.self, from: data)
            return loanStore.loans
        } catch {
            print(error)
        }
        
        return []
    }
    
    func filterLoans(maxAmount: Int) {
        self.loans = self.cachedLoans.filter { $0.amount < maxAmount }
    }
}
