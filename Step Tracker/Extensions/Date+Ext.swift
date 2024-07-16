//
//  Date+Ext.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 16.7.2024.
//

import Foundation

extension Date {
    var weekdayInt: Int {
        Calendar.current.component(.weekday, from: self)
    }
}
