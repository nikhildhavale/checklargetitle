//
//  ViewController.swift
//  CheckLargeTitle
//
//  Created by nikhil on 28/04/22.
//

import UIKit
public class FontConstants: NSObject {
    public static let UITabbarTitleFontNormal: CGFloat = 10
    public static let UITabbarTitleFontSelected: CGFloat = 10
    public static let UINavbarTitleFontSmall: CGFloat = 17
    public static let UINavbarTitleFontLarge: CGFloat = 34
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = UILabel()
        label.text = "News feed"
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        let barButtonItem = UIBarButtonItem(customView: label)
        self.navigationItem.leftBarButtonItems = [barButtonItem]
        let rightone = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .done, target: nil, action: nil)
        let rightsecond = UIBarButtonItem(image: UIImage(systemName: "message"), style: .done, target: nil, action: nil)
        self.navigationItem.rightBarButtonItems = [rightone,rightsecond]
        
    }
    override func viewWillAppear(_ animated:Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.configappearance()
    }
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }

}

extension UINavigationBar
{
    @available(iOS 15.0, *)
    @objc func configappearance()
    {
        configappearance(barColor: .green , titleColor: .black)
        
    }
    @available(iOS 15.0, *)
    @objc func configappearance(barColor:UIColor?,titleColor:UIColor)
    {
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = barColor
        standardAppearance.shadowColor = .clear
        let titleFont = UIFont.systemFont(ofSize: FontConstants.UINavbarTitleFontSmall)
        standardAppearance.titleTextAttributes  = [NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font:titleFont]
        let largeTitlefont = UIFont.boldSystemFont(ofSize: FontConstants.UINavbarTitleFontLarge)
        standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font:largeTitlefont]
        scrollEdgeAppearance = standardAppearance
    }
}
