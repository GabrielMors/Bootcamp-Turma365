//
//  ChatService.swift
//  ChatGPT-Turma365
//
//  Created by Gabriel Mors  on 11/8/24.
//

import UIKit

class ChatService {
    private let baseUrl = "https://api.openai.com" // Armazena a URL base da API do OpenAI
    
//    cria uma URLSession que sempre inclui os cabeçalhos authorization e Content-Type nas requisições, facilitando o uso de APIs que exigem autenticacao e dados JSON
//  Cabeçalhos HTTP sao informacoes extrar que enviamos junto com uma requisicao HTTP para fornecer detalhes sobre a requisicao ou cliente (nesse caso, seu app). Eles sao composto por pares chave e valor, e, ajudam o servidor entender o contexto da requisicao  e tratá-la
    
    var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(APIKeys.authToken)",
                                               "Content-Type": "application/json"
        ]
        return URLSession(configuration: configuration) // retorno da sessao configurada
    }
    
    func requestChat(_ text: String, completion: @escaping (Result<Response, Error>) -> Void) {
        let path = "/v1/chat/completions" // Define o endpoint especificado
        let urlString = baseUrl + path // contrói a URL completa
        guard let url = URL(string: urlString) else { return } // Usa guard let para verificar se a URL é valida
        
        var request = URLRequest(url: url) // Cria uma instancia de URLRequest e define o metood HTTP com POST
        request.httpMethod = "POST"
        
        do {
            // Corpo da requisição (HTTPBody)
            let httpBody = Request(
                model: "gpt-4o-mini",
                messages: [MessageElement(role: "user", content: text)],
                temperature: 0.7
            )
            request.httpBody = try JSONEncoder().encode(httpBody) // Usa JSONEncoder() para codificar o httpBody como JSON e atribiui ao request.httpBody
            
        } catch {
            completion(.failure(error)) // Deu ruim
            return
        }
        
        session.dataTask(with: request) { data, response, error in // Inicia uma tarefa de rede (dataTask) que envia a requisição configurada. A resposta da API ou erro é tratada dentro do blaco de conclusão.
            NetworkLogger.log(request: request, response: response as? HTTPURLResponse, data: data)
            
            if let error = error {
                completion(.failure(error))// Verificar se existe um erro
            }
            
            guard let data else { return } // Verificar se existe um dado
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data) // Usa JSONDecoder() para decodificar para um objeto Swift (Response)
                completion(.success(response)) // Chama a closure informando o retorno de sucesso
            } catch {
                completion(.failure(error)) // Não conseguiu fazer a requisição
            }
        }.resume() // Start da requisição
    }
    
}
