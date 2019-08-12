//
//  ViewController.swift
//  MemCards
//
//  Created by YS on 8/12/19.
//  Copyright © 2019 YS. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageController: UIPageViewController!
    var controllers = [UIViewController]()
    
    var addCardButton: UIButton!
    
    let closeButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageController.dataSource = self
        pageController.delegate = self
        
        addChild(pageController)
        
        view.addSubview(pageController.view)
        
//        let views = ["pageController": pageController.view] as [String: AnyObject]
        
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageController]|", options: [], metrics: nil, views: views))
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageController]|", options: [], metrics: nil, views: views))
        
//        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.backgroundColor = .black
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        
        self.view.addSubview(closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false;
        closeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true;
        closeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
        // Do any additional setup after loading the view.
    
        for _ in 1...2 {
            let vc = UIViewController()
            vc.view.backgroundColor = randomColor()
            controllers.append(vc)
        }
        
        
        addCardButton = UIButton(frame: CGRect.zero)
        addCardButton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        addCardButton.layer.cornerRadius = 100
        addCardButton.setTitle("+", for: .normal)
        addCardButton.titleLabel?.font = .boldSystemFont(ofSize: 70)
        addCardButton.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        
        let lastVC = controllers.last!
        
        lastVC.view.addSubview(addCardButton)
        
        addCardButton.translatesAutoresizingMaskIntoConstraints = false
        addCardButton.centerYAnchor.constraint(equalTo: lastVC.view.centerYAnchor).isActive = true
        addCardButton.centerXAnchor.constraint(equalTo: lastVC.view.centerXAnchor).isActive = true
        addCardButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        addCardButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        pageController.setViewControllers([controllers[0]], direction: .forward, animated: false)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            } else {
                return nil
            }
        }
        return nil
    }
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addCard() {
        let vc = AddListViewController()
        present(vc, animated: true, completion: nil)
    }

//    var cardName = String()
//
//    //    var scrollView = UIScrollView()
//    //
//    //    let cardView = UIView()
//

//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.backgroundColor = .white
//        //        self.view.addSubview(cardView)
//        //        cardView.translatesAutoresizingMaskIntoConstraints = false
//        //        cardView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
//        //        cardView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
//        //        cardView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        //        cardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        //
//        //        scrollView.addSubview(cardView)
//        //        scrollView.contentSize = cardView.bounds.size
//        //        self.view.addSubview(scrollView)
//        //        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        //        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
//        //        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
//        //        scrollView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        //        scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
//
//        //        self.view.addSubview(scrollView)
//
//        closeButton.setTitle("Close", for: .normal)
//        closeButton.setTitleColor(.white, for: .normal)
//        closeButton.backgroundColor = .black
//        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
//
//        self.view.addSubview(closeButton)
//
//        closeButton.translatesAutoresizingMaskIntoConstraints = false;
//        closeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true;
//        closeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
//        // Do any additional setup after loading the view.
//    }
//
//    @objc func closeView() {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        <#code#>
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        <#code#>
//    }

}

