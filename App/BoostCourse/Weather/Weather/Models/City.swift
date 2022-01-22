/*
 {
    "city_name":"서울",
    "state":12,
    "celsius":17.8,
    "rainfall_probability":60
 },
 */

import Foundation


struct City:Codable{
    let name:String
    let state:Int
    let celsius:Float
    let rainfallProbability:Int
    
    enum Codingkeys : String, CodingKey{
        case state, celsius
        case name = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}
