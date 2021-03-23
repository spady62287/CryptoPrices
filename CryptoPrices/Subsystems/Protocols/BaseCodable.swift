//
//  BaseCodable.swift
//  CryptoPrices
//
//  Created by Daniel Spady on 2021-03-22.
//

import Foundation

protocol BaseCodable: Codable {
    static var jsonDecoder: JSONDecoder { get }
    static func fromJSON<T: Decodable>(_ data: Data?) -> T?
}

extension BaseCodable {
    public static var jsonDecoder: JSONDecoder {
        let result: JSONDecoder = JSONDecoder()
        
        result.dateDecodingStrategy = .formatted(DateFormatter.init())
        
        return result
    }
    public static func fromJSON<T: Decodable>(_ data: Data?) -> T? {
        guard let data = data else {
            return nil
        }
        
        // Return
        do {
            return try jsonDecoder.decode(T.self, from: data)
        }
        catch {
            return nil
        }
//        Debug
//        do {
//            let decoder = JSONDecoder()
//            let messages = try decoder.decode(T.self, from: data)
//            print(messages as Any)
//        } catch DecodingError.dataCorrupted(let context) {
//            print(context)
//        } catch DecodingError.keyNotFound(let key, let context) {
//            print("Key '\(key)' not found:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch DecodingError.valueNotFound(let value, let context) {
//            print("Value '\(value)' not found:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch DecodingError.typeMismatch(let type, let context) {
//            print("Type '\(type)' mismatch:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch {
//            print("error: ", error)
//        }
    }
}
