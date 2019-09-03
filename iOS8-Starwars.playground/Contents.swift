import UIKit

// https://swapi.co/api/people/1/


struct Person: Codable {
    let name: String
    let height: String  // Int vs. String
    let hair_color: String // hairColor vs. hair_color
}

let url = URL(string: "https://swapi.co/api/people/1/")!
let data = try! Data(contentsOf: url)

let decoder = JSONDecoder()

let luke = try! decoder.decode(Person.self, from: data)

print(luke)
