//
//  UITextField+textValue.swift
//  Кинопоиск
//
//  Created by Сергей Иванов on 21/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit


extension UITextField {
    var textValue: String {
        return self.text ?? ""
    }
}
