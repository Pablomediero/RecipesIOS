//
//  ChatgptRequestBody.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

import Foundation
struct ChatgptRequestBody: Encodable {
    let model: String
    let prompt: String
    let max_tokens: Int
    let temperature: Double
    init(model: String, prompt: String, max_tokens: Int, temperature: Double) {
        self.model = model
        self.prompt = prompt
        self.max_tokens = max_tokens
        self.temperature = temperature
    }
}
