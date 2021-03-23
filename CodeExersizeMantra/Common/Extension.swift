//
//  Extension.swift
//  CodeExersizeMantra
//
//  Created by Anil on 16/03/21.
//

import Foundation
import UIKit

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
extension UIImageView {
    func methodForRoundTheCircle(radious : CGFloat){
        layer.cornerRadius = radious
    }
}
