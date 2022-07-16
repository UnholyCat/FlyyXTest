//
//  Section.swift
//  FlyyAssignment
//
//  Created by Ajitkumar Marigoli on 16/07/22.
//

import Foundation

class Section: Codable{
    var sectionType: SectionType?
    var sectionTitle: String?
    var cells: [Cell]?
    
    public init(){
        
    }
}
