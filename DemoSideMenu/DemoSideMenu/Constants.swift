//
//  Constants.swift
//  DemoSideMenu
//
//  Created by Cuong on 9/13/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let toggle                 = Notification.Name("toggle")
    static let selectPromo                 = Notification.Name("selectPromo")
    
}

enum Keys : String {
    case access_token = "access_token"
    case clientID = "clientID"
}

enum SegueIdentifier : String {
    case goToMain = "goToMain"
    case showBooking = "showBooking"
    case showBaseBooking = "showBaseBooking"
}

enum WorkingType : Int {
    case airCool = 1
    case camera
    case light
    
    var title: String {
        switch self {
        case .camera:
            return "Sửa chữa Camera"
        case .airCool:
            return "Sửa chữa Điều Hoà"
        case .light:
            return "Sửa chữa Đèn"
        }
    }
}

struct ConstantString {
    static let normalNavigationButtonTitle = "Chọn danh mục sửa chữa"
    static let  pickupPlacePlease = "Bấm vào đây để chọn địa điểm!"
    static let pendingWorking = "Đang đặt lịch "
}


struct NetworkString {
    static let errorTitle  = "Sự cố đường truyền"
    static let errorMessage  = "Rất tiếc, đã mất kết nối mạng, vui lòng kiểm tra lại các cài đặt đường truyền Wifi, 3G"
    static let announce = "Thông báo"
    static let networkOK = "Đã có tín hiệu đường truyền"
}

enum OrderStatus: Int {
    case waiting      = 0
    case accept       = 1
    case cancel       = -1
    case reject       = -2
    case rejectAdmin  = -3
    case done         = 2
    case rated        = 3
}
