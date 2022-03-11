//
//  ChannelIdentifier.swift
//  ActionCableClient
//
//  Created by Dmitry Korotchenkov on 11.03.2022.
//

import Foundation

open class ChannelIdentifier {
    
    private struct Constants {
        static let channelKey = "channel"
    }
    
    private var dict: Dictionary<String, Any> {
        didSet {
            var uniqueJsonString = ""
            if let JSONData = try? JSONSerialization.data(withJSONObject: dict, options: .sortedKeys) {
                uniqueJsonString = String(data: JSONData, encoding: .utf8) ?? ""
            }
            self.uniqueJsonString = uniqueJsonString
        }
    }
    
    private(set) var uniqueJsonString: String
    
    public init (dict: Dictionary<String, Any>) {
        uniqueJsonString = ""
        self.dict = dict
    }
    
    public convenience init() {
        self.init(dict: Dictionary())
    }
    
    func setChannelName(name: String) {
        if (dict[Constants.channelKey] as? String) == name {
            return
        } else {
            dict[Constants.channelKey] = name
        }
    }
    
    func channelName() -> String? {
        return dict[Constants.channelKey] as? String
    }
    
}
