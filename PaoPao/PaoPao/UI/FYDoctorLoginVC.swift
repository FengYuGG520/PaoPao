//
//  FYDoctorLoginVC.swift
//  PaoPao
//
//  Created by YGBD on 2020/6/11.
//  Copyright © 2020 FengYu. All rights reserved.
//

import UIKit
import ObjectMapper

extension UIViewController {
    
    func toFYDoctorLoginVC() {
        let vc = UIViewController.fy_vc(inSB: "Main", ID: "FYDoctorLoginVC") as! FYDoctorLoginVC
        self.navigationController?.wxs_pushViewController(vc, makeTransition: { (transition) in
            transition?.animationType = .brickCloseVertical
            transition?.animationTime = 0.25
            transition?.backGestureEnable = false
        })
    }
    
}

class FYDoctorLoginVC: FYViewController {
    
    
    @IBOutlet weak var navHeight: NSLayoutConstraint!
    
    let fYDoctorLoginVCTableCell: String = "fYDoctorLoginVCTableCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var modelArr: [HelloDoctorModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navHeight.constant = navHeightConstant
        
        setupUI()
        loadData()
    }
    
    func setupUI() {
        tableView.fy_cutSeparator()
        tableView.fy_target(self)
        tableView.fy_tableRegisterXib("FYDoctorLoginVCTableCell", fYDoctorLoginVCTableCell)
    }
    
    func loadData() {
        
        FYDB.GO(SQL.doctorLogin()) { [weak self] (tasks) in
            let obj = Mapper<HelloDoctorModel>().mapArray(JSONArray: tasks)
            if obj.count == 0 {
                print("没数据")
                return
            }
            var modelArr: [HelloDoctorModel] = []
            for p in obj {
                modelArr.append(p)
            }
            self?.modelArr = modelArr
            self?.tableView.reloadData()
        }
    }
    
    @IBAction func popClick(_ sender: Any) {
        self.fy_pop(animated: true)
    }
    
}

extension FYDoctorLoginVC: UITableViewDataSource {
    
    // 返回组
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 返回行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return modelArr.count
    }
    
    // 返回cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: fYDoctorLoginVCTableCell, for: indexPath) as! FYDoctorLoginVCTableCell
        cell.actual_name.text = modelArr[indexPath.row].actual_name
        cell.rong_status_time.text = modelArr[indexPath.row].rong_status_time
        return cell
    }
    
}

extension FYDoctorLoginVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 31.0
    }
    
}
