//
//  SQL.swift
//  PaoPao
//
//  Created by YGBD on 2020/6/11.
//  Copyright © 2020 FengYu. All rights reserved.
//

import UIKit

class SQL: NSObject {
    
    class func chanpin() -> String {
        return SQL.sqlFile("产品.txt")
    }
    
    class func doctorLogin() -> String {
        return SQL.sqlFile("医生登录时间.txt")
    }
    
    private class func sqlFile(_ fileName: String) -> String {
        var str: String = ""
        do {
            str = try String(contentsOfFile: Bundle.main.path(forResource: fileName, ofType: nil) ?? "", encoding: .utf8)
        } catch {}
        return str
    }
    
}
