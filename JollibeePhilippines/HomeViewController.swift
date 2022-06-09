//
//  HomeViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/02.
//

import UIKit

class HomeViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var viewItem1: UIView!
    @IBOutlet weak var viewItem2: UIView!
    @IBOutlet weak var viewItem3: UIView!
    
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var stopTrace: UIButton!
    @IBOutlet weak var secretButton: UIButton!
    
    @IBOutlet weak var product1: UIButton!
    @IBOutlet weak var product2: UIButton!
    
    var prevScreen: String = ""
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var viewInPopupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        viewItem1.layer.cornerRadius = 10.0
        viewItem2.layer.cornerRadius = 10.0
        viewItem3.layer.cornerRadius = 10.0

        product1.layer.borderWidth = 1.0
        product1.layer.borderColor = CGColor.init(red: 1.0, green: 140 / 255, blue: 0.0, alpha: 0.5)
        product1.layer.cornerRadius = 25.0

        product2.layer.borderWidth = 1.0
        product2.layer.borderColor = CGColor.init(red: 1.0, green: 140 / 255, blue: 0.0, alpha: 0.5)
        product2.layer.cornerRadius = 25.0
        
        if prevScreen == "SignUp" {
            popupView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            popupView.layer.shadowColor = UIColor.black.cgColor
            popupView.layer.shadowOpacity = 0.6
            popupView.layer.shadowRadius = 4
            popupView.layer.cornerRadius = 10.0
            
            viewInPopupView.layer.cornerRadius = 10.0
            
            let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.singleTap(_:)))
            tapGesture.delegate = self
            self.view.addGestureRecognizer(tapGesture)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.backgroundView.isHidden = false
                self.popupView.isHidden = false
            }
        }
        
        TealiumHelper.shared.trackView(title: "Home", data: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onClickOrderNow(_ sender: Any) {
        TealiumHelper.shared.track(title: "order-now", data: nil)
    }
    
    
    @IBAction func onClickGetPromo(_ sender: Any) {
        TealiumHelper.shared.track(title: "get-promo", data: nil)
        
        let uiViewController = tabBarController?.viewControllers?[1]
        tabBarController?.selectedViewController = uiViewController
    }
    
    @IBAction func onClickProduct1(_ sender: Any) {
        TealiumHelper.shared.track(title: "click-product1", data: nil)
        
        performSegue(withIdentifier: "product", sender: nil)
    }
    
    @IBAction func onClickProduct2(_ sender: Any) {
        TealiumHelper.shared.track(title: "click-product2", data: nil)
        
        performSegue(withIdentifier: "product", sender: nil)
    }
    
    @IBAction func onStopTrace(_ sender: Any) {
        TealiumHelper.shared.leaveTrace()
    }
    
    @objc func singleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            backgroundView.isHidden = true
            popupView.isHidden = true
        }
    }
    
    @IBAction func onSecret(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
