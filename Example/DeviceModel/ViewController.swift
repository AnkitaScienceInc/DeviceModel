//
//  ViewController.swift
//  DeviceModel
//
//  Created by Ankita Kalangutkar on 09/26/2016.
//  Copyright (c) 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit
import DeviceModel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let deviceModelName: DeviceModel = DeviceModel()
        print(deviceModelName.getDeviceModel())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

