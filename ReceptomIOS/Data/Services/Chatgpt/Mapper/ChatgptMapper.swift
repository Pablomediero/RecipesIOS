//
//  ChatgptMapper.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 5/1/24.
//

import Foundation
struct ChatgptMapper {
    static func toRemote(type: [String], mode: Bool, recipeName: String) -> ChatgptRequestBody {
        let prompt: String
        if mode {
            prompt = "Necesito una receta, tengo como ingredientes \(type.joined(separator: ",")), devuélveme como resultado un formato JSON empezando directamente en llaves {} con el siguiente formato: " +
                "{\"id\": 0,\"name\":\"Nombre receta\",\"ingredients\":[{\"id\":0,\"idRecipe\": 0,\"name\": \"Nombre de Ingrediente\"}],\"instructions\": \"Resultado preparación de la receta.\",\"serving\": numero de personas}\n" +
                "Quiero que introduzcas todos los ingredientes que necesite la receta además de los que ya tengo, todos los campos id quiero que sean 0 y en una sola línea, que no existan saltos de línea."
        } else {
            prompt = "No quiero \(recipeName), necesito otra receta distinta pero con los mismos ingredientes \(type.joined(separator: ",")), devuelveme como resultado un formato JSON empezando la respuesta directamente desde el inicio de llaves ({}) sin caracteres previos, con el siguiente formato: " +
                "{\"id\": 0,\"name\":\"Nombre receta\",\"ingredients\":[{\"id\":0,\"idRecipe\": 0,\"name\": \"Nombre de Ingrediente\"}],\"instructions\": \"Resultado preparación de la receta.\",\"serving\": numero de personas}\n" +
                "Quiero que introduzcas todos los ingredientes que necesite la receta ademas de los que ya tengo, todos los campos id quiero que sean 0 y en una sola linea, que no existan saltos de linea"
        }
        return ChatgptRequestBody(
            model: "gpt-3.5-turbo-instruct",
            prompt: prompt,
            max_tokens: 1000,
            temperature: 0
        )
    }
    static func fromRemote(type: ApiRecipe) -> Recipe {
           let ingredientsString = type.ingredients.map { $0.name }.joined(separator: ",")
           return Recipe(
                name: type.name,
                ingredients: ingredientsString,
                instructions: type.instructions,
                serving: type.serving)
       }
}

