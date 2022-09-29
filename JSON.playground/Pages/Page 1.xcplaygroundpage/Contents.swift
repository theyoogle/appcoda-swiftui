
import SwiftUI

let json = """
{
    "name": "John Davis",
    "country": "Peru",
    "use": "to buy a new collection of clothes to stock her shop before the holidays." ,
    "amount": 150
}
"""

struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
}

let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    do {
        let loan = try decoder.decode(Loan.self, from: jsonData)
        print(loan)
    } catch {
        print(error)
    }
}
