import UIKit

// https://swapi.co/api/people/1/


struct Person: Codable {
    
    
    let name: String
    let height: Int  // Int vs. String
    let hairColor: String // hairColor vs. hair_color
    
    // Can name something else if you've overriden init()
    
//    enum CodingKeys: String, CodingKey {
    enum PersonKeys: String, CodingKey {
        case name
        case height // Set it equal to the value in JSON
        case hairColor = "hair_color"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PersonKeys.self)
        
//        name = try? container.decode(String.self, forKey: .name) ?? "Default Name"
        name = try container.decode(String.self, forKey: .name)
        
        let heightString = try container.decode(String.self, forKey: .height)
        height = Int(heightString) ?? 0  // 0 or -1 to indicate that we have an error (investigate with API)
        
        hairColor = try container.decode(String.self, forKey: .hairColor)
        
    }
    
}

let url = URL(string: "https://swapi.co/api/people/1/")!
let data = try! Data(contentsOf: url)

let decoder = JSONDecoder()

let luke = try! decoder.decode(Person.self, from: data)

print(luke)
