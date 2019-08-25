//
//  CustomSlider.swift
//  Slider
//
//  Created by DuyCuong on 8/25/19.
//  Copyright © 2019 DuyCuong. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //chỉnh kích thước của thanh slider
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
    }

}
