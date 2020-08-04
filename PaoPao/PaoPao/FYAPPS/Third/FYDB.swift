//
//  FYDB.swift
//  PaoPao
//
//  Created by YGBD on 2020/6/11.
//  Copyright © 2020 FengYu. All rights reserved.
//

import UIKit
import OHMySQL

class FYDB {
    
    private static var manager: OHMySQLStoreCoordinator?
    private class func defaultManager() -> OHMySQLStoreCoordinator? {
        if manager == nil {
            // 连接数据库
            let userName = "root" // 用户名
            let password = "YGJKDB47..3889755789DSs" // 密码
            let ip = "119.23.210.225" // ip或域名（默认端口3306）
            let dbName = "db_hello_doctor_new" // 数据库名字
            
            let coordinator: OHMySQLStoreCoordinator = OHMySQLStoreCoordinator.init(user: OHMySQLUser.init(userName: userName, password: password, serverName: ip, dbName: dbName, port: 3306, socket: ip) ?? OHMySQLUser())
            coordinator.connect()
            
            if coordinator.isConnected {
                switch coordinator.pingMySQL() {
                case .none:
                    print("数据库连接成功")
                    // Query Context
                    let queryContext: OHMySQLQueryContext = OHMySQLQueryContext()
                    queryContext.storeCoordinator = coordinator
                    OHMySQLManager.shared.mainQueryContext = queryContext
                    
                    manager = coordinator
                case .lost:
                    print("与服务器的连接丢失")
                case .gone:
                    print("MySQL服务器已经消失了")
                case .unknown:
                    print("未知错误")
                default:
                    print("其他错误")
                }
            }
            else {
                print("数据库未连接")
            }
        }
        else {
            if !(manager?.isConnected ?? false) {
                manager?.connect()
            }
        }
        return manager
    }
    
    class func GO(_ queryString: String, successed: ((_ response: [[String: Any]])->())) {
        if FYDB.defaultManager() == nil {
            print("连接数据库失败")
            return
        }
        let query: OHMySQLQueryRequest = OHMySQLQueryRequest.init(queryString: queryString)
        do {
            let tasks = try OHMySQLManager.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
            successed(tasks ?? [])
            print("调用数据库断开连接方法")
            manager?.disconnect()
        } catch {}
    }
    
    
}
