//
//  URLSessionNetworkClient.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

import Foundation


class URLSessionNetworkClient: NetworkClient {
    func post<T: Decodable, U: Encodable>(url: String, body: U) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkClientError.badUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(ApiConstants.API_KEY)", forHTTPHeaderField: "Authorization")
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // -------- Descomentar ver respuesta
            /*
             
             print("Request URL: \(request.url?.absoluteString ?? "URL not available")")
            print("Request: \(request)")
            print("Response Status Code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
            print("Response Extend Body: \(String(data: data, encoding: .utf8) ?? "No response body")")
            
             */
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkClientError.requestFailed
            }

            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("Error in URLSessionNC: \(error)")
            throw error
        }
    }
}
