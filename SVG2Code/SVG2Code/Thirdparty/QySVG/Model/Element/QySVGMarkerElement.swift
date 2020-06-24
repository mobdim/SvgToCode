//
//  QySVGMarkerElement.swift
//  SVG2Code
//
//  Created by Le Quang on 6/22/20.
//  Copyright © 2020 Le Quang. All rights reserved.
//

import Foundation
import SwiftyXMLParser

class QySVGMarkerElement: QySVGNode {
    override var tag: QySVGTag { return  QySVGTag.kMarker}
    override init() {
        super.init()
        self.attribute[QySVGAttributeName.kMarkerHeight.rawValue] = QySVGAttribute(attributeName: .kMarkerHeight)
        self.attribute[QySVGAttributeName.kMarkerUnits.rawValue] = QySVGAttribute(attributeName: .kMarkerUnits)
        self.attribute[QySVGAttributeName.kMarkerWidth.rawValue] = QySVGAttribute(attributeName: .kMarkerWidth)
        self.attribute[QySVGAttributeName.kOrient.rawValue] = QySVGAttribute(attributeName: .kOrient)
        self.attribute[QySVGAttributeName.kPreserveAspectRatio.rawValue] = QySVGAttribute(attributeName: .kPreserveAspectRatio)
        self.attribute[QySVGAttributeName.kRefX.rawValue] = QySVGAttribute(attributeName: .kRefX)
        self.attribute[QySVGAttributeName.kRefY.rawValue] = QySVGAttribute(attributeName: .kRefY)
        self.attribute[QySVGAttributeName.kViewBox.rawValue] = QySVGAttribute(attributeName: .kViewBox)
    }
    override func updateNode(byElement element: XML.Element, index: Int, deep: Int) {
        super.updateNode(byElement: element, index: index, deep: deep)
        if let value = element.attributes[QySVGAttributeName.kMarkerHeight.rawValue], let attribute = self.attribute[QySVGAttributeName.kMarkerHeight.rawValue] {
            attribute.addAttributeValue(value: value, priority: .inline)
        }
        if let value = element.attributes[QySVGAttributeName.kMarkerUnits.rawValue], let attribute = self.attribute[QySVGAttributeName.kMarkerUnits.rawValue] {
            attribute.addAttributeValue(value: value, priority: .inline)
        }
        if let value = element.attributes[QySVGAttributeName.kMarkerWidth.rawValue], let attribute = self.attribute[QySVGAttributeName.kMarkerWidth.rawValue] {
            attribute.addAttributeValue(value: value, priority: .inline)
        }
        if let value = element.attributes[QySVGAttributeName.kOrient.rawValue], let attribute = self.attribute[QySVGAttributeName.kOrient.rawValue] {
            attribute.addAttributeValue(value: value, priority: .inline)
        }
        if let value = element.attributes[QySVGAttributeName.kPreserveAspectRatio.rawValue], let attribute = self.attribute[QySVGAttributeName.kPreserveAspectRatio.rawValue] {
            attribute.addAttributeValue(value: value, priority: .inline)
        }
        if let value = element.attributes[QySVGAttributeName.kRefX.rawValue], let attribute = self.attribute[QySVGAttributeName.kRefX.rawValue] {
            attribute.addAttributeValue(value: value, priority: .inline)
        }
        if let value = element.attributes[QySVGAttributeName.kRefY.rawValue], let attribute = self.attribute[QySVGAttributeName.kRefY.rawValue] {
            attribute.addAttributeValue(value: value, priority: .inline)
        }
        if let value = element.attributes[QySVGAttributeName.kViewBox.rawValue], let attribute = self.attribute[QySVGAttributeName.kViewBox.rawValue] {
            attribute.addAttributeValue(value: value, priority: .inline)
        }
    }
}