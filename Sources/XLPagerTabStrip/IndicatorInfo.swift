//  IndicatorInfo.swift
//  XLPagerTabStrip ( https://github.com/xmartlabs/XLPagerTabStrip )
//
//  Copyright (c) 2017 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import UIKit

public struct IndicatorInfo {
    
    public struct BadgeOptions {
        public var title: String
        public var backgroundColor: UIColor
        public var cornerRadius: CGFloat = 4
        public var spacing: CGFloat = 4
        public var font: UIFont
        public var insets: UIEdgeInsets = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
        public var titleColor: UIColor
        
        public init(
             title: String,
             backgroundColor: UIColor,
             cornerRadius: CGFloat = 4,
             spacing: CGFloat = 4,
             font: UIFont,
             insets: UIEdgeInsets = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4),
             titleColor: UIColor
         ) {
             self.title = title
             self.backgroundColor = backgroundColor
             self.cornerRadius = cornerRadius
             self.spacing = spacing
             self.font = font
             self.insets = insets
             self.titleColor = titleColor
         }
    }

    public var title: String?
    public var image: UIImage?
    public var highlightedImage: UIImage?
    public var accessibilityLabel: String?
    public var userInfo: Any?
    public var badge: BadgeOptions?
    
    public init(title: String?) {
        self.title = title
        self.accessibilityLabel = title
    }
    
    public init(title: String?, badge: BadgeOptions) {
        self.title = title
        self.badge = badge
        self.accessibilityLabel = title
    }
    
    public init(image: UIImage?, highlightedImage: UIImage? = nil, userInfo: Any? = nil) {
        self.image = image
        self.highlightedImage = highlightedImage
        self.userInfo = userInfo
    }
    
    public init(title: String?, image: UIImage?, highlightedImage: UIImage? = nil, userInfo: Any? = nil) {
        self.title = title
        self.accessibilityLabel = title
        self.image = image
        self.highlightedImage = highlightedImage
        self.userInfo = userInfo
    }
    
    public init(title: String?, accessibilityLabel:String?, image: UIImage?, highlightedImage: UIImage? = nil, userInfo: Any? = nil) {
        self.title = title
        self.accessibilityLabel = accessibilityLabel
        self.image = image
        self.highlightedImage = highlightedImage
        self.userInfo = userInfo
    }

}

extension IndicatorInfo : ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        title = value
        accessibilityLabel = value
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        title = value
        accessibilityLabel = value
    }

    public init(unicodeScalarLiteral value: String) {
        title = value
        accessibilityLabel = value
    }
}
