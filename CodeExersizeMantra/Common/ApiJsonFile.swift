//
//  ApiJsonFile.swift
//  CodeExersizeMantra
//
//  Created by Anil on 15/03/21.
//

import Foundation

protocol CategoryAPIClientProtocol {
    func getContacts(completion: @escaping (Data?) -> Void)
}

class CategoryAPIClient: CategoryAPIClientProtocol {
    func getContacts(completion: @escaping (Data?) -> Void) {
        if let path = Bundle.main.path(forResource: "menu", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                completion(data)
              } catch {
                   // handle error
                completion(nil)
                print("Error!! Unable to parse \(path).json")
              }
        }
    }
}
