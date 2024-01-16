//
//  Recipe.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//
import Foundation
struct Recipe: Identifiable, Decodable, Equatable, Hashable {
    var id: UUID?
    var name: String
    var ingredients: String
    var instructions: String
    var serving: Int
    
}
