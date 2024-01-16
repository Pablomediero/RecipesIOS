//
//  ChatgptRepository.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

struct ChatgptRepository {
    private let remoteService: ChatgptRemoteService
    
    init(remoteService: ChatgptRemoteService) {
        self.remoteService = remoteService
    }
    
    func getChatResponse(order: Order) async throws -> Recipe {
        try await remoteService.getChatResponse(order: order)
    }
}
