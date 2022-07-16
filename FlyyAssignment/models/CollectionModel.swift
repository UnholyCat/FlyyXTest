//
//  CollectionModel.swift
//  FlyyAssignment
//
//  Created by Ajitkumar Marigoli on 16/07/22.
//

import Foundation

class CollectionModel: Codable{
    var sequence: Int?
    var title: String?
    var showSearch: Bool?
    var tabIcon: String?
    var tabTitle: String?
    var sections: [Section]?
    
    public init(){
        
    }
}
