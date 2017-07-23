//
//  PageView.swift
//  PagingScrollView
//
//  Created by JoshuaKuehn on 7/23/17.
//  Copyright © 2017 Kuehn LLC. All rights reserved.
//

import Foundation
import UIKit

class PageView: UIView {
  
  private var headerTextField = UITextField()
  var headerText: String = "" {
    didSet {
      headerTextField.text = headerText
    }
  }
  
  private var paragraphTextView = UITextView()
  var paragraphText: String = "" {
    didSet {
      paragraphTextView.text = paragraphText
    }
  }
  
  init(frame: CGRect, headerText: String, paragraphText: String, backgroundColor: UIColor) {
    super.init(frame: frame)
    setup()
    self.headerTextField.text = headerText
    self.paragraphTextView.text = paragraphText
    self.backgroundColor = backgroundColor
    
  }
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    
    headerTextField.isUserInteractionEnabled = false
    headerTextField.textColor = .black
    headerTextField.textAlignment = .center
    headerTextField.sizeToFit()
    
    paragraphTextView.isUserInteractionEnabled = false
    paragraphTextView.textColor = .black
    paragraphTextView.textAlignment = .center
    paragraphTextView.sizeToFit()
    paragraphTextView.isScrollEnabled = false
    paragraphTextView.backgroundColor = .clear
    
    headerTextField.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(headerTextField)
    paragraphTextView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(paragraphTextView)
    
    NSLayoutConstraint.activate([
      headerTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      headerTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      paragraphTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      paragraphTextView.topAnchor.constraint(equalTo: headerTextField.bottomAnchor, constant: 20),
      paragraphTextView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: (2/3))
    ])
  }
  
}


















