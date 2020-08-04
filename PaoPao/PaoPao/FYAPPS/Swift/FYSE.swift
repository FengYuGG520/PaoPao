//
//  FYSE.swift
//  PaoPao
//
//  Created by YGBD on 2020/6/18.
//  Copyright © 2020 FengYu. All rights reserved.
//

import UIKit

class FYSE: NSObject {
    
    private static let key: [UInt8] = [0x1, 0x5, 0x8, 0x1, 0x2, 0x8, 0x2, 0x9, 0x2, 0x0, 0x7]
    
    // 加密
    class func jiami(_ str: String) -> String {
        // String -> Data
        // Data -> [UInt8]
        // [UInt8] 亦或
        // [UInt8] -> Data
        // Data -> String
        var bytes: [UInt8] = [UInt8](str.data(using: .utf8)!)
        for i in 0..<bytes.count {
            bytes[i] = bytes[i] ^ key[i % key.count]
        }
        return (NSString(data: Data(bytes), encoding: String.Encoding.utf8.rawValue) ?? "") as String
    }
    
    // 解密
    class func jiemi(_ str: String) -> String {
        var bytes: [UInt8] = [UInt8](str.data(using: .utf8)!)
        print(bytes)
        for i in 0..<bytes.count {
            bytes[i] = bytes[i] ^ key[i % key.count]
        }
        return (NSString(data: Data(bytes), encoding: String.Encoding.utf8.rawValue) ?? "") as String
    }
    
}
