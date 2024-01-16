//
//  getChatgptResponse.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

struct GetChatgptResponseUseCase {
    private let chatgptRepository: ChatgptRepository
    
    init(chatgptRepository: ChatgptRepository) {
        self.chatgptRepository = chatgptRepository
    }
     
    func execute(order: Order) async throws -> Recipe {
        try await chatgptRepository.getChatResponse(order: order)
    }
}
