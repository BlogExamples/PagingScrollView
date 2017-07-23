//
//  ViewController.swift
//  PagingScrollView
//

import UIKit

class ViewController: UIViewController {
  
  let placeHolderText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
  
  // Set the frames to zero because we'll be using AutoLayout to size them
  var scrollView = UIScrollView(frame: .zero)
  var stackView = UIStackView(frame: .zero)
  var views:[UIView] = []
  var pageControl = UIPageControl()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // *** SETUP SCROLLVIEW *** //
    
    // *** SETUP STACKVIEW AND ADD SUBVIEWS *** //
    
    // Initializing the views we'll put in the scrollView and adding them to an array for convenience
    let pageView1 = PageView(headerText: "Header 1", paragraphText: placeHolderText, backgroundColor: .red)
    views.append(pageView1)
    let pageView2 = PageView(headerText: "Header 2", paragraphText: placeHolderText, backgroundColor: .orange)
    views.append(pageView2)
    let pageView3 = PageView(headerText: "Header 3", paragraphText: placeHolderText, backgroundColor: .blue)
    views.append(pageView3)
    let pageView4 = PageView(headerText: "Header 4", paragraphText: placeHolderText, backgroundColor: .green)
    views.append(pageView4)
    
    // *** ADD PAGECONTROLL *** //
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

