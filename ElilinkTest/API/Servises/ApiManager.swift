//
//  ApiManager.swift
//  ElilinkTest
//
//  Created by Николай Морголь on 12.09.21.
//

import Foundation


enum ApiTypes{
    
    case getPhoto
    
    var baseUrl: String{
        return "https://loremflickr.com/"
    }
    
    var path: String{
        switch self {
        case .getPhoto:
            return "200/200/"
        
        }
    }
    
    var request: URLRequest{
        let url = URL(string: path, relativeTo: URL(string: baseUrl))!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}


class ApiManager {
    static let shared = ApiManager()
    
    func getPhoto(completion: @escaping(Data)->()) {
        let request = ApiTypes.getPhoto.request
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data{
                completion(data)
            }
        }
        task.resume()
    }
}
