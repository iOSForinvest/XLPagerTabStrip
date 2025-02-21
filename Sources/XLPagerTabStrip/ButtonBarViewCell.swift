//  ButtonBarViewCell.swift
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

import UIKit
import Foundation

open class ButtonBarViewCell: UICollectionViewCell {
    
    private var badgeConstraints: [NSLayoutConstraint] = []
    
    @IBOutlet open var imageView: UIImageView!
    @IBOutlet open var label: UILabel!
    @IBOutlet open var newBadge: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isAccessibilityElement = true
        accessibilityTraits.insert([.button, .header])
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        badgeConstraints = [
            badgeLabel.leadingAnchor.constraint(equalTo: newBadge.leadingAnchor),
            badgeLabel.trailingAnchor.constraint(equalTo: newBadge.trailingAnchor),
            badgeLabel.topAnchor.constraint(equalTo: newBadge.topAnchor),
            badgeLabel.bottomAnchor.constraint(equalTo: newBadge.bottomAnchor)
        ]
        NSLayoutConstraint.activate(badgeConstraints)
    }
    
    open override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            super.isSelected = newValue
            if (newValue) {
                accessibilityTraits.insert(.selected)
            } else {
                accessibilityTraits.remove(.selected)
            }
        }
    }
    
    func updateBadgeInsets(_ insets: UIEdgeInsets) {
        if let leading = badgeConstraints.first(where: { $0.firstAttribute == .leading }) {
            leading.constant = insets.left
        }
        
        if let trailing = badgeConstraints.first(where: { $0.firstAttribute == .trailing }) {
            trailing.constant = -insets.right
        }
        
        if let top = badgeConstraints.first(where: { $0.firstAttribute == .top }) {
            top.constant = insets.top
        }
        
        if let bottom = badgeConstraints.first(where: { $0.firstAttribute == .bottom }) {
            bottom.constant = -insets.bottom
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
