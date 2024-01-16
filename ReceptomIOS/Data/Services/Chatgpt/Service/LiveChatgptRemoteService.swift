//
//  LiveChatgptRemoteService.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

import Foundation
struct LiveChatgptRemoteService: ChatgptRemoteService {
    private let networkClient : NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getChatResponse(order: Order) async throws -> Recipe {
        let requestBody = ChatgptMapper.toRemote(type: order.ingredients, mode: order.mode, recipeName: order.recipeName)
        let response: ApiResponse<String> = try await networkClient.post(url: ApiConstants.API_URL, body: requestBody)
        let jsonData = response.choices[0].text.data(using: .utf8)
        let recipe = try JSONDecoder().decode(ApiRecipe.self, from: jsonData!)
        let mapedRecipe = ChatgptMapper.fromRemote(type: recipe)
        return mapedRecipe
    }

}
