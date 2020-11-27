//
//  MetadataStore.swift
//  Ursus Chat
//
//  Created by Daniel Clelland on 18/06/20.
//  Copyright © 2020 Protonome. All rights reserved.
//

import Foundation
import Alamofire
import UrsusAirlock

extension Client {
    
    public func metadataStore(ship: Ship) -> MetadataStoreApp {
        return app(ship: ship, app: "metadata-store")
    }
    
}

public class MetadataStoreApp: AirlockApp {
    
    @discardableResult public func allSubscribeRequest(handler: @escaping (SubscribeEvent<Result<SubscribeResponse, Error>>) -> Void) -> DataRequest {
        return subscribeRequest(path: "/all", handler: handler)
    }
    
    @discardableResult public func appNameSubscribeRequest(app: String, handler: @escaping (SubscribeEvent<Result<SubscribeResponse, Error>>) -> Void) -> DataRequest {
        return subscribeRequest(path: "/app-name/\(app)", handler: handler)
    }
    
}

extension MetadataStoreApp {
    
    public enum SubscribeResponse: Decodable {
        
        case metadataUpdate(MetadataUpdate)
        
        enum CodingKeys: String, CodingKey {
            
            case metadataUpdate = "metadata-update"
            
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            switch Set(container.allKeys) {
            case [.metadataUpdate]:
                self = .metadataUpdate(try container.decode(MetadataUpdate.self, forKey: .metadataUpdate))
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Failed to decode \(type(of: self)); available keys: \(container.allKeys)"))
            }
        }
        
    }
    
}
