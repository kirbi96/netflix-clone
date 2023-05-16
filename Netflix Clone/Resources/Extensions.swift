//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Макаров Кирилл Андреевич on 16.05.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter () -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
