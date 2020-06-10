//
//  ViewController.swift
//  PaoPao
//
//  Created by FengYu on 2020/6/10.
//  Copyright © 2020 FengYu. All rights reserved.
//

import UIKit
import OHMySQL

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    func test() {
        
        let auser: OHMySQLUser = OHMySQLUser.init(userName: "root", password: "Ygbd..9207fengyuGG520", serverName: "119.23.210.225", dbName: "db_hello_doctor_new", port: 3306, socket: "119.23.210.225") ?? OHMySQLUser()
        
        let coordinator: OHMySQLStoreCoordinator = OHMySQLStoreCoordinator.init(user: auser)
        
        coordinator.connect()
        
        if coordinator.isConnected {
            switch coordinator.pingMySQL() {
            case .none:
                print("数据库连接成功")
                test2(coordinator)
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
        
    }

    func test2(_ coordinator: OHMySQLStoreCoordinator) {
        let queryContext: OHMySQLQueryContext = OHMySQLQueryContext()
        queryContext.storeCoordinator = coordinator
        OHMySQLManager.shared.mainQueryContext = queryContext
        
        test3()
    }
    
    func test3() {
        
        var query: OHMySQLQueryRequest = OHMySQLQueryRequestFactory.select("t_doctors", condition: nil)
        
        do {
            var tasks: [Any] = try OHMySQLManager.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query) as! [Any]
            
            print("tasks -> \(tasks)")
        } catch {}
        
        
        
        
    }
    

}

