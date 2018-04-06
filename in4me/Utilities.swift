//
//  Utilities.swift
//  in4me
//
//  Created by Maximilian Klinke on 06.04.18.
//  Copyright © 2018 Maximilian Klinke. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

class UILabelWithInsets: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: LayoutConstants.LABEL_INSET_VERT, left: LayoutConstants.LABEL_INSET_HORZ, bottom: LayoutConstants.LABEL_INSET_VERT, right: LayoutConstants.LABEL_INSET_HORZ)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
}
