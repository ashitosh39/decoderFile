//
//  PopulationModelClass.swift
//  decoderFile
//
//  Created by Macintosh on 03/02/24.
//

import Foundation
struct PopulationApi : Decodable{
    var data : [Datas]
}
struct Datas : Decodable{
   
   
    var Year : String
    var Population : Int
  
}
