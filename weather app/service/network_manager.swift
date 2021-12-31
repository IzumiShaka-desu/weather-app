//
//  network_manager.swift
//  weather app
//
//  Created by Akashaka on 30/12/21.
//

import Foundation
class NetworkManager{
    //error type that might appear
    enum Errors:Error{
        case invalidResponse
        case invalidStatusCode(Int)
    }
    //request method that will be used
    enum RequestMethod: String{
        case get
        case post
        var method: String{rawValue.uppercased()}
    }
    func request<T: Decodable>(fromUrl url: URL,requestMethod:RequestMethod = .get,completion:@escaping(Result<T,Error>)->Void){
        let completionOnMain: (Result<T,Error>)->Void={ result in
            DispatchQueue.main.async {
                completion(result)
            }
            
        }
        
        var request=URLRequest(url: url)
        request.httpMethod=request.httpMethod
        let urlSession=URLSession.shared.dataTask(with: request){data,response,error in
            if let error = error {
                completionOnMain(.failure(error))
                return
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                return completionOnMain(.failure(Errors.invalidResponse))
                
            }
            if !(200..<300).contains(urlResponse.statusCode){
                return completionOnMain(.failure(Errors.invalidStatusCode(urlResponse.statusCode)))
            }
            guard let data = data else {
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self,from : data)
                completionOnMain(.success(result))
            } catch {
                debugPrint("couldn\'t parse result data")
                completionOnMain(.failure(error))
            }
            
        }
        urlSession.resume()
        
    }
}
