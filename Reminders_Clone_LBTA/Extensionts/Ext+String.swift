//
//  Ext+String.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 19.06.2024.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
