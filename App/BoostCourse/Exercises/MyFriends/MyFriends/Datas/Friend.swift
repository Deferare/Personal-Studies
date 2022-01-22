/*
{
    "name":"하나",
    "age":22,
    "address_info": {
        "country":"대한민국",
        "city":"울산"
    }
}
 */
 

import Foundation


struct Friend: Codable{
    
    struct AddressInfo:Codable{
        let country:String
        let city:String
    }
    
    let name:String
    let age:Int
    let addressInfo:AddressInfo
    
    var nameAndage : String {return self.name + "(\(self.age))"}
    var fullAddress: String {return self.addressInfo.country + ", " + self.addressInfo.city}
    
    enum CodingKeys:String, CodingKey{
        case name, age
        case addressInfo = "address_info"
    }
    
}
