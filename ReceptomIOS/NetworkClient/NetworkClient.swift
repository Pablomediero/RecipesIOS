//
//  NetworkClient.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

protocol NetworkClient {
    func post<T: Decodable, U: Encodable>(url: String, body: U) async throws -> T

}
