//
//  ViewController.swift
//  PagingScrollView
//

import UIKit

class ViewController: UIViewController {
  
  let placeHolderText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
  
  // Set the frames to zero because we'll be using AutoLayout to size them
  private var scrollView = UIScrollView(frame: .zero)
  private var stackView = UIStackView(frame: .zero)
  private var views:[UIView] = []
  var pageControl = UIPageControl()

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  private func setup() {
    // *** SETUP SCROLLVIEW *** //
    // [1]
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = .black
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.isPagingEnabled = true
    scrollView.delegate = self
    
    // [2]
    self.view.addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
      // [1]
      scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -10),
      // [2]
      scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
      scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ])
    
    // *** SETUP STACKVIEW AND ADD SUBVIEWS *** //
    // [1]
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.distribution = .equalSpacing
    stackView.spacing = 20
    
    // [2]
    scrollView.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10)
    ])
    
    // Initializing the views we'll put in the scrollView and adding them to an array for convenience
    let pageView1 = PageView(headerText: "Header 1", paragraphText: placeHolderText, backgroundColor: .red)
    views.append(pageView1)
    let pageView2 = PageView(headerText: "Header 2", paragraphText: placeHolderText, backgroundColor: .orange)
    views.append(pageView2)
    let pageView3 = PageView(headerText: "Header 3", paragraphText: placeHolderText, backgroundColor: .blue)
    views.append(pageView3)
    let pageView4 = PageView(headerText: "Header 4", paragraphText: placeHolderText, backgroundColor: .green)
    views.append(pageView4)
    
    // [1]
    views.forEach { (view) in
      view.translatesAutoresizingMaskIntoConstraints = false
      // [2]
      stackView.addArrangedSubview(view)
      view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
      view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    // *** ADD PAGECONTROLL *** //
    // [1]
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(pageControl)
    pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
    // [2]
    pageControl.numberOfPages = views.count
    // [3]
    pageControl.addTarget(self, action: #selector(pageControlTapped(sender:)), for: .valueChanged)
    
  }
  
  func pageControlTapped(sender: UIPageControl) {
    print("Tapped")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageWidth = scrollView.bounds.width
    let pageFraction = scrollView.contentOffset.x/pageWidth
    
    pageControl.currentPage = Int((round(pageFraction)))
  }
}

































