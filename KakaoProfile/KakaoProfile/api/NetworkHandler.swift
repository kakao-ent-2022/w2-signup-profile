//
//  NetworkHandler.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/19.
//

import Foundation
import CoreText

enum NetworkError: Error {
    case url
    case paramsError
    case duplicateId
    case parseError
    case unknown
}

enum NetworkConstant {
    static let signUpUrl = "https://api.codesquad.kr/signup"
}

enum RequestMethod: String {
    case post = "POST"
}

class NetworkHandler {
    
    static func postSignUp(id: String, password: String) async throws {
        let defaultSession = URLSession(configuration: .default)
        
        let signUpBody = getSignUpBody(id: id, password: password)
        let request = try getRequest(url: NetworkConstant.signUpUrl, method: .post, body: signUpBody)
        
        let (_, response): (Data, URLResponse) = try await defaultSession.data(for: request)
        
        try handleSignUpResponse(response: response)
    }
    
    private static func getRequest(url: String, method: RequestMethod, body: Data?) throws -> URLRequest {
        guard let url = URL(string: "\(NetworkConstant.signUpUrl)") else{
            print("URL is null")
            throw NetworkError.url
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethod.post.rawValue
        request.httpBody = body
        return request
    }
    
    private static func getSignUpBody(id: String, password: String) -> Data? {
        return "{\"id\": \"\(id)\", \"password\": \"\(password)\"}".data(using: .utf8)
    }
    
    private static func handleSignUpResponse(response: URLResponse) throws {
        guard let response = response as? HTTPURLResponse
        else {
            throw NetworkError.parseError
        }
        
        let statusCode = SignUpStatusCode.findBy(statusCode: response.statusCode)
        switch statusCode {
        case .success:
            return
        case .duplicateError:
            throw NetworkError.duplicateId
        case .paramsError:
            throw NetworkError.paramsError
        case .none:
            throw NetworkError.unknown
        }
    }
}
