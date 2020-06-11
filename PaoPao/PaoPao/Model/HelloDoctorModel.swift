//
//  HelloDoctorModel.swift
//  PaoPao
//
//  Created by YGBD on 2020/6/11.
//  Copyright © 2020 FengYu. All rights reserved.
//

import UIKit
import ObjectMapper

class HelloDoctorModel: Mappable {
    
    var drug_name: String?
    var purchase_price: Float?
    var doctor_price: Float?
    var sales_volume: Int?
    var actual_name: String?
    var rong_status_time: String?

    required init?(map: Map) {}
    
    func mapping(map: Map) {
        drug_name <- map["drug_name"]
        purchase_price <- map["purchase_price"]
        doctor_price <- map["doctor_price"]
        sales_volume <- map["sales_volume"]
        actual_name <- map["actual_name"]
        rong_status_time <- map["rong_status_time"]
    }
}
