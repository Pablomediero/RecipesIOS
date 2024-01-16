//
//  ChatgptRemoteService.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

protocol ChatgptRemoteService {
    func getChatResponse(order: Order) async throws -> Recipe
}
