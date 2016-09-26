//
//  DeviceModel.swift
//  DeviceModel
//
//  Created by Ankita Kalangutkar on 6/20/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit

public class DeviceModel: NSObject {

   public func getDeviceModel() -> String {
        var size : Int = 0 // as Ben Stahl noticed in his answer
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](count: Int(size), repeatedValue: 0)
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        let sDeviceModel = String.fromCString(machine)!
        
        var deviceType: String?
        
        switch sDeviceModel {
        case "i386":
            deviceType = "Simulator"  //iPhone Simulator
            break
        case "iPhone1,1":
            deviceType = "iPhone1G"  //iPhone 1G
            break
        case "iPhone1,2":
            deviceType = "iPhone3G"  //iPhone 3G
            break
        case "iPhone2,1":
            deviceType = "iPhone3GS"  //iPhone 3GS
            break
        case "iPhone3,1":
            deviceType = "iPhone4 AT&T"  //iPhone 4 - AT&T
            break
        case "iPhone3,2":
            deviceType = "iPhone4 Other"  //iPhone 4 - Other carrier
            break
        case "iPhone3,3":
            deviceType = "iPhone4"  //iPhone 4 - Other carrier
            break
        case "iPhone4,1":
            deviceType = "iPhone4S"  //iPhone 4S
            break
        case "iPhone5,1", "iPhone5,2":
            deviceType = "iPhone5"  //iPhone 5 (GSM)
            break
        case "iPhone5,3", "iPhone5,4":
            deviceType = "iPhone5C"  //iPhone 5c (GSM)
            break
        case "iPhone6,1", "iPhone6,2":
            deviceType = "iPhone5S"  //iPhone 5s (GSM)
            break
        case "iPhone7,2":
            deviceType = "iPhone6"  //iPhone 6 (GSM)
            break
        case "iPhone7,1":
            deviceType = "iPhone6Plus"  //iPhone6Plus (GSM)
            break
        case "iPhone8,1":
            deviceType = "iPhone6S"  //iPhone6S (GSM)
            break
        case "iPhone8,2":
            deviceType = "iPhone6SPlus"  //iPhone6SPlus (GSM)
            break
        case "iPhone8,4":
            deviceType = "iPhone SE"  //iPhone SE (GSM)
            break
        case "iPhone9,1", "iPhone9,3":
            deviceType = "iPhone 7"
            break
        case "iPhone9,2", "iPhone9,4":
            deviceType = "iPhone 7 Plus"
            break
            
        case "iPod1,1":
            deviceType = "iPod1stGen"  //iPod Touch 1G
            break
        case "iPod2,1":
            deviceType = "iPod2ndGen"  //iPod Touch 2G
            break
        case "iPod3,1":
            deviceType = "iPod3rdGen"  //iPod Touch 3G
            break
        case "iPod4,1":
            deviceType = "iPod4thGen"  //iPod Touch 4G
            break
        case "iPod5,1":
            deviceType = "iPod5thGen"  //iPod Touch 5G
            break
        case "iPod6,1":
            deviceType = "iPod6thGen"  //iPod Touch 6G
            break
            
        case "iPad1,1":
            deviceType = "iPadWiFi"  //iPad Wifi
            break
        case "iPad1,2":
            deviceType = "iPad3G"  //iPad 3G
            break
        case "iPad2,1":
            deviceType = "iPad2"  //iPad 2 (WiFi)
            break
        case "iPad2,2":
            deviceType = "iPad2"  //iPad 2 (GSM)
            break
        case "iPad2,3":
            deviceType = "iPad2"  //iPad 2 (CDMA)
            break
        case "iPad2,5":
            deviceType = "iPad Mini (WiFi)"
            break
        case "iPad2,6":
            deviceType = "iPad Mini (GSM)"  //iPad Mini (GSM)
            break
        case "iPad2,7":
            deviceType = "iPad Mini (GSM+CDMA)"  //iPad Mini (GSM+CDMA)
            break
        case "iPad3,1":
            deviceType = "iPad 3 (WiFi)"  //iPad 3 (WiFi)
            break
        case "iPad3,2":
            deviceType = "iPad 3 (GSM+CDMA)"  //iPad 3 (GSM+CDMA)
            break
        case "iPad3,3":
            deviceType = "iPad 3 (GSM)"  //iPad 3 (GSM)
            break
        case "iPad3,4":
            deviceType = "iPad 4 (WiFi)"  //iPad 4 (WiFi)
            break
        case "iPad3,5":
            deviceType = "iPad 4 (GSM)"  //iPad 4 (GSM)
            break
        case "iPad3,6":
            deviceType = "iPad 4 (GSM+CDMA)"  //iPad 4 (GSM+CDMA)
            break
        case "iPad4,1":
            deviceType = "iPad Air (WiFi)"  //iPad Air (WiFi)
            break
        case "iPad4,2":
            deviceType = "iPad Air (Cellular)"  //iPad Air (Cellular)
            break
        case "iPad4,4":
            deviceType = "iPad mini 2G (WiFi)"  //iPad mini 2G (WiFi)
            break
        case "iPad4,5":
            deviceType = "iPad mini 2G (Cellular)"  //iPad mini 2G (Cellular)
            break
        case "iPad4,7":
            deviceType = "iPad mini 3 (WiFi)"  //iPad mini 3 (WiFi)
            break
        case "iPad4,8":
            deviceType = "iPad mini 3 (Cellular)"  //iPad mini 3 (Cellular)
            break
        case "iPad4,9":
            deviceType = "iPad mini 3 (China Model)"  //iPad mini 3 (China Model)
            break
        case "iPad5,3":
            deviceType = "iPad Air 2 (WiFi)"  //iPad Wifi
            break
        case "iPad5,4":
            deviceType = "iPad Air 2 (Cellular)"  //iPad Air 2 (Cellular)
            break
        case "iPad6,8":
            deviceType = "iPad Pro"  //iPad Pro
            break
        default: break
        }
        
        let aux:String = sDeviceModel.componentsSeparatedByString(",")[0]
        
//         if a newer version exists
        if (aux.rangeOfString("iPhone") != nil) {
            let version = Int(aux.stringByReplacingOccurrencesOfString("iPhone", withString: ""))
            if version == 3 {
                deviceType = "iPhone4"
            }
            if version >= 4 {
                deviceType = "iPhone4s"
            }
        }
        
        if (aux.rangeOfString("iPod") != nil) {
            let version = Int(aux.stringByReplacingOccurrencesOfString("iPod", withString: ""))
            if version >= 4 {
                deviceType = "iPod4thGen"
            }
        }
        
        if (aux.rangeOfString("iPad") != nil) {
            let version = Int(aux.stringByReplacingOccurrencesOfString("iPad", withString: ""))
            if version == 1 {
                deviceType = "iPad3G"
            }
            if version >= 2 {
                deviceType = "iPad2"
            }
        }
        
        if sDeviceModel != "" {
            deviceType = sDeviceModel
        }
        else {
            deviceType = "iOS"
        }

        return deviceType!
    }
}
