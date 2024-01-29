import Foundation

enum ApiError: Error {
    case invalidURL,
         requestError(description: String),
         invalidResponse,
         invalidData,
         decodingError(description: String)
}

enum TypeOfInformation {
    case adoptables
    
    var baseURL: String {
        "https://batata"
    }
    
    var endpoint: String {
        switch self {
        case .adoptables:
            return ""
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(endpoint)")
    }
    
    var httpMethod: String {
        switch self {
        case .adoptables:
            return "GET"
        }
    }
}

protocol ApiServiceProtocol {
    func fetchAnimals(completion: @escaping (Result<[Animal], ApiError>) -> Void)
}

final class ApiService: NSObject, ApiServiceProtocol, URLSessionDelegate {
    func fetchAnimals(completion: @escaping (Result<[Animal], ApiError>) -> Void) {
        fetchData(info: .adoptables, body: nil, completion: completion)
    }
    
    private lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    private func fetchData<T: Codable>(info: TypeOfInformation, body: [String: Any]?, completion: @escaping (Result<T, ApiError>) -> Void) {
        guard let url = info.url else {
            return completion(.failure(ApiError.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = info.httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = body, let bodyData = try? JSONSerialization.data(withJSONObject: body, options: []) {
            request.httpBody = bodyData
        }
            
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestError(description: error.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                return completion(.failure(.invalidData))
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let result = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                completion(.failure(.decodingError(description: error.localizedDescription)))
            }
        }
        dataTask.resume()
    }
}
