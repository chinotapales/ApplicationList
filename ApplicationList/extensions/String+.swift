//
//  String+.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation

extension String? {
    func toURL() -> URL? {
        if let self,
           let url = URL(string: self) {
            url
        } else {
            nil
        }
    }
}
